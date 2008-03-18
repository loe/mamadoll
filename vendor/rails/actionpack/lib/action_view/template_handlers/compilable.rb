module ActionView
  module TemplateHandlers
    module Compilable

      def self.included(base)
        base.extend ClassMethod
      end

      module ClassMethod
        # If a handler is mixin this module, set compilable to true
        def compilable?
          true
        end
      end

      # Compile and evaluate the template's code
      def compile_template(template, file_name, local_assigns)
        return unless compile_template?(template, file_name, local_assigns)

        template ||= read_template_file(file_name, nil)

        render_symbol = assign_method_name(template, file_name)
        render_source = create_template_source(template, render_symbol, local_assigns.keys)
        line_offset   = self.template_args[render_symbol].size + self.line_offset

        begin
          file_name = 'compiled-template' if file_name.blank?
          ActionView::Base::CompiledTemplates.module_eval(render_source, file_name, line_offset)
        rescue Exception => e  # errors from template code
          if @view.logger
            @view.logger.debug "ERROR: compiling #{render_symbol} RAISED #{e}"
            @view.logger.debug "Function body: #{render_source}"
            @view.logger.debug "Backtrace: #{e.backtrace.join("\n")}"
          end

          raise ActionView::TemplateError.new(@view.finder.extract_base_path_from(file_name) ||
                @view.finder.view_paths.first, file_name || template, @view.assigns, template, e)
        end

        self.compile_time[render_symbol] = Time.now
        # logger.debug "Compiled template #{file_name || template}\n  ==> #{render_symbol}" if logger
      end

      private

      # Method to check whether template compilation is necessary.
      # The template will be compiled if the inline template or file has not been compiled yet,
      # if local_assigns has a new key, which isn't supported by the compiled code yet,
      # or if the file has changed on disk and checking file mods hasn't been disabled.
      def compile_template?(template, file_name, local_assigns)
        method_key    = file_name || template
        render_symbol = @view.method_names[method_key]

        compile_time = self.compile_time[render_symbol]
        if compile_time && supports_local_assigns?(render_symbol, local_assigns)
          if file_name && !@view.cache_template_loading
            template_changed_since?(file_name, compile_time)
          end
        else
          true
        end
      end

      def assign_method_name(template, file_name)
        method_key = file_name || template
        @view.method_names[method_key] ||= compiled_method_name(template, file_name)
      end

      def compiled_method_name(template, file_name)
        ['_run', self.class.to_s.demodulize.underscore, compiled_method_name_file_path_segment(file_name)].compact.join('_').to_sym
      end

      def compiled_method_name_file_path_segment(file_name)
        if file_name
          s = File.expand_path(file_name)
          s.sub!(/^#{Regexp.escape(File.expand_path(RAILS_ROOT))}/, '') if defined?(RAILS_ROOT)
          s.gsub!(/([^a-zA-Z0-9_])/) { $1.ord }
          s
        else
          (self.inline_template_count += 1).to_s
        end
      end

      # Method to create the source code for a given template.
      def create_template_source(template, render_symbol, locals)
        body = compile(template)

        self.template_args[render_symbol] ||= {}
        locals_keys = self.template_args[render_symbol].keys | locals
        self.template_args[render_symbol] = locals_keys.inject({}) { |h, k| h[k] = true; h }

        locals_code = ""
        locals_keys.each do |key|
          locals_code << "#{key} = local_assigns[:#{key}]\n"
        end

        "def #{render_symbol}(local_assigns)\n#{locals_code}#{body}\nend"
      end

      # Return true if the given template was compiled for a superset of the keys in local_assigns
      def supports_local_assigns?(render_symbol, local_assigns)
        local_assigns.empty? ||
          ((args = self.template_args[render_symbol]) && local_assigns.all? { |k,_| args.has_key?(k) })
      end

      # Method to handle checking a whether a template has changed since last compile; isolated so that templates
      # not stored on the file system can hook and extend appropriately.
      def template_changed_since?(file_name, compile_time)
        lstat = File.lstat(file_name)
        compile_time < lstat.mtime ||
          (lstat.symlink? && compile_time < File.stat(file_name).mtime)
      end

    end
  end
end