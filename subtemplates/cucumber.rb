if yes?("Use Cucumber behavior testing?", :yellow)
  
  say("Installing the cucumber environment....", :cyan)
  
  @use_cucumber = true
  
  gem 'database_cleaner', :group => :test
  gem 'cucumber',         :group => :test
  gem 'cucumber-rails',   :group => :test
  gem 'launchy',          :group => :test

  if yes?("Use Capybara instead of Webrat?", :yellow)
    gem 'capybara',       :group => :test

    @use_capybara = true
  else
    gem 'webrat', :group => :test
  end

  unless Gem.available?("cucumber-rails")
    run 'gem install cucumber --no-rdoc --no-ri'
    run 'gem install cucumber-rails --no-rdoc --no-ri'
  else
    say("Found cucumber, skipping installation", :cyan)
    say("Found cucumber-rails, skipping installation", :cyan)
  end

  unless Gem.available?("database_cleaner")
    run 'gem install database_cleaner --no-rdoc --no-ri'
  else
    say("Found database_cleaner, skipping installation", :cyan)
  end

  unless Gem.available?("launchy")
    run 'gem install launchy --no-rdoc --no-ri'
  else
    say("Found launchy gem, skipping installation", :cyan)
  end
  
  Gem.refresh
  
  if @use_capybara
    unless Gem.available?("capybara")
      run 'gem install capybara --no-rdoc --no-ri'
    else
      say("Found capybara gem, skipping installation", :cyan)
    end
  else
    unless Gem.available?("webrat")
      run 'gem install webrat --no-rdoc --no-ri'
    else
      say("Found webrat gem, skipping installation", :cyan)
    end
  end
  
  Gem.refresh
  
  arguments = [].tap do |arguments|
    arguments << "--webrat"    if @use_capybara.nil?
    arguments << "--capybara"  if @use_capybara.present?
    arguments << "--rspec"     if yes?("Use with rspec?", :yellow)
  end

  generate "cucumber:install #{arguments.join(" ")}"

  get "#{@resource_path}/cucumber.yml", "config/cucumber.yml", :force => true

end