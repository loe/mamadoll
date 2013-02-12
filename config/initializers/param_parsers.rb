# Disable these to reduce security vulnerabilities.
ActionController::Base.param_parsers.delete(Mime::XML)
ActionController::Base.param_parsers.delete(Mime::JSON)
