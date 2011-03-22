say("Using cancan - see: https://github.com/ryanb/cancan", :cyan)

gem "cancan"

@generate ||= {}
@generate[:cancan] = lambda {
  generate "cancan:ability"

  inject_into_file "app/controllers/application_controller.rb", :after => "protect_from_forgery\n" do
    #(" " * 2) + "\ncheck_authorization\n" +
    (" " * 2) + "\n" +
    (" " * 2) + "rescue_from CanCan::AccessDenied do |exception|\n" +
    (" " * 2) + "  redirect_to root_url, :alert => exception.message\n" +
    (" " * 2) + "end\n"
  end
}