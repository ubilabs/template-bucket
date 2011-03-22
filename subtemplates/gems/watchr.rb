say("Using watchr - see: https://github.com/mynyml/watchr", :cyan)
gem 'watchr'

say("You may use .watchr.rb script: $ watchr .watchr.rb", :cyan)
get "#{@resource_path}/watchr.rb", ".watchr.rb"
