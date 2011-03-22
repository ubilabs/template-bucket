run 'bundle install'

if yes?("Create database?", :yellow)
  rake "db:create"
end
