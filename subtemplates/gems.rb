gem 'rails3-generators'

@gem_template_path = File.dirname(__FILE__)+"/gems"

gem_templates= %w{haml jammit devise formtastic cancan email_spec inherited_resources kaminari watchr exception_notification rails_admin}

gem_templates.each do |template|
  if yes?("Apply Template for #{template}?", :yellow)
    apply @gem_template_path+"/#{template}.rb"
  end
end



