say("Using formtastic - see: https://github.com/justinfrench/formtastic", :cyan)

gem 'formtastic', '~> 1.2.3'
gem 'validation_reflection', '~> 1.0.0'

if @use_jammit
  inject_into_file "config/assets.yml", :after => "- public/stylesheets/reset.css\n" do
    "    - public/stylesheets/formtastic.css\n"
  end
else
  @layout ||= {}
  @layout[:formtastic] = lambda{
    if @use_haml
      inject_into_file "application.html.haml", :after => "/ insert stylesheet here\n" do
        "= stylesheet_link_tag 'formtastic'\n"
      end
    else
      inject_into_file "application.html.erb", :after => "<!-- insert stylesheet here -->\n" do
        "<%= stylesheet_link_tag 'formtastic', 'formtastic_changes' %>\n"
      end
    end
  }
end
  

@generate ||= {}
@generate[:formtastic] = lambda {
  generate "formtastic:install"
}