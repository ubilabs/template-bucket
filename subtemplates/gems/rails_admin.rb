say("Using rails-admin - see: https://github.com/sferik/rails_admin", :cyan)

gem 'devise'
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

@generate ||= {}
@generate[:rails_admin] = lambda {
  generate "rails_admin:install_admin"
  
  if yes?("Do you want to use the Ckeditor?")
    rake "admin:ckeditor_download"
  end
  
  create_file "config/initializers/rails_admin.rb" do
    <<-RUBY
    RailsAdmin.config do |config|
    #  # Exclude Models
    #  config.excluded_models << ClassName
    #  
    #  # Visible Tabs
    #  config.navigation.max_visible_tabs 3
    #  
    #  # Default number of rows
    #  config.list.default_items_per_page = 50
    #  
    #  # Global default sorting
    #  config.models do
    #    list do
    #      sort_by :updated_at
    #      sort_reverse true
    #    end
    #  end
    #    
    #  #### Block configuration for a specific model ###
    #  config.model Foo do
    #    # Changes class label
    #    label "List of teams"
    #   
    #    # Changes object/instance name
    #    object_label do
    #      "#{bindings[:object].name} - #{bindings[:object].league.name}"
    #    end
    #   
    #    # Hides from navigation
    #    visible false
    #    # or with a block
    #    visible { false }
    #    
    #    #### List configuration
    #    list do
    #      
    #      # Number of rows
    #      items_per_page 100
    #      
    #      # Sorting
    #      sort_by :updated_at
    #      sort_reverse {true}
    #      
    #      # Explicit field visibility
    #      field :name
    #      
    #      # Field configuration
    #      field :revenue do
    #        # Visibility based on runtime logic
    #        visible do
    #          current_user.roles.include?(:accounting) # metacode
    #        end
    #        # Labelling
    #        label "Title"
    #        # Formatting
    #        formatted_value do
    #          value.to_i
    #          # For dates
    #          date_format :short
    #          strftime_format "%Y-%m-%d"
    #        end
    #        # Sortability
    #        sortable false
    #        # CSS Class
    #        css_class "customClass"
    #        # Column width
    #        column_width 200
    #      end
    #      
    #    end
    #    
    #    ### Edit view configuration
    #    edit do
    #      # TODO
    #    end
    #  
    #  end
    #
    end
    RUBY
  end 
}