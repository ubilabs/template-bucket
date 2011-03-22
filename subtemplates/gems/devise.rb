say("Using devise - see: https://github.com/plataformatec/devise", :cyan)

gem "devise"
if @use_haml
  gem "hpricot"
  gem "ruby_parser"
end

@generate ||= {}
@generate[:devise] = lambda {
  generate "devise:install"
  devise_model = ask("Enter Devise model name (nothing for User):", :yellow)
  devise_model = "User" if devise_model.blank?
  
  generate "devise #{devise_model}"
  if @use_haml
    say("You must have installed 'hpricot' and 'ruby_parser' gems for devise haml views!!", :cyan)
    run "rails generate devise:views -e haml"
  else
    run "rails generate devise:views"
  end
}