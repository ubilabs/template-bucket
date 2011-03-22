gem 'jammit'

create_file "config/assets.yml" do
  "package_assets: on\n" +
  "embed_images: off\n\n" +
  "javascripts:\n" +
  "  application:\n" +
  "    - public/javascripts/jquery/jquery.min.js\n" +
  "    - public/javascripts/jquery/jquery.metadata.js\n" +
  "    - public/javascripts/rails.js\n" +
  "    - public/javascripts/application.js\n\n" +
  "stylesheets:\n" +
  "  application:\n" +
  "    - public/stylesheets/reset.css\n"
end

@use_jammit = true