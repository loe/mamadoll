namespace 'views' do
  desc 'Renames all your rhtml views to erb'
  task 'rename' do
    Dir.glob('app/views/**/*erb').each do |file|
      puts `mv #{file} #{file.gsub(/html.html.erb$/, '.html.erb')}`
    end
  end
end