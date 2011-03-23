if @use_haml
  get "#{@resource_path}/reset.scss", "public/stylesheets/sass/reset.scss"

  append_file ".gitignore" do
    "public/stylesheets/*.css"
  end

else
  get "#{@resource_path}/reset.css",  "public/stylesheets/reset.css"
end

inside "app/views/layouts" do
  remove_file "application.html.erb"

  if @use_haml
    get "#{@resource_path}/layout.html.haml", "application.html.haml"

    # gsub_file "application.html.haml", /\/ insert javascript here\n/, "= include_javascripts :application\n" if @use_jammit.present?
    # gsub_file "application.html.haml", /\/ insert javascript here\n/, "= javascript_include_tag :defaults\n" if @use_jammit.nil?
    inject_into_file "application.html.haml", :after => "/ insert javascript here\n" do
      @use_jammit ? "#{' ' * 4}= include_javascripts :application\n" : "#{' ' * 4}= javascript_include_tag :defaults\n"
    end

    # gsub_file "application.html.haml", /\/ insert stylesheet here\n/, "= include_stylesheets :application\n"  if @use_jammit.present?
    # gsub_file "application.html.haml", /\/ insert stylesheet here\n/, "= stylesheet_link_tag 'reset'\n"       if @use_jammit.nil?    
    inject_into_file "application.html.haml", :after => "/ insert stylesheet here\n" do
      @use_jammit ? "#{' ' * 4}= include_stylesheets :application\n" : "#{' ' * 4}= stylesheet_link_tag 'reset'\n"
    end

  else
    get "#{@resource_path}/layout.html.erb", "application.html.erb"

    #gsub_file "application.html.erb", /<!-- insert javascript here -->\n/, "<%= include_javascripts :application %>\n" if @use_jammit.present?
    #gsub_file "application.html.erb", /<!-- insert javascript here -->\n/, "<%= javascript_include_tag :defaults %>\n" if @use_jammit.nil?
    inject_into_file "application.html.erb", :after => "<!-- insert javascript here -->\n" do
      @use_jammit ? "<%= include_javascripts :application %>\n" : "<%= javascript_include_tag :defaults %>\n"
    end
    
    # gsub_file "application.html.erb", /<!-- insert stylesheet here -->\n/, "<%= include_stylesheets :application %>\n" if @use_jammit.present?
    # gsub_file "application.html.erb", /<!-- insert stylesheet here -->\n/, "<%= stylesheet_include_tag 'reset' %>\n"   if @use_jammit.nil?
    inject_into_file "application.html.erb",  :after => "<!-- insert stylesheet here -->\n" do
      @use_jammit ? "<%= include_stylesheets :application %>\n" : "<%= stylesheet_include_tag 'reset' %>\n"
    end
  end
end

@layout.each{|k,v| say("Applying layout changes for '#{k}'"); v.call} if @layout
