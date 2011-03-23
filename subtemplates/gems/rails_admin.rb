say("Using rails-admin - see: https://github.com/sferik/rails_admin", :cyan)

gem 'devise'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

@generate ||= {}
@generate[:rails_admin] = lambda {
  generate "rails_admin:install_admin"
  
  if yes?("Do you want to use the Ckeditor?")
    rake "admin:ckeditor_download"
  end
  
}