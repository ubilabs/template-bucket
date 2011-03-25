say("Using email-spec - see: https://github.com/bmabey/email-spec", :cyan)

gem "email_spec",  :group=>:test

if @use_cucumber
  append_file "features/support/env.rb" do
    "# Make sure this require is after you require cucumber/rails/world.
    require 'email_spec' # add this line if you use spork
    require 'email_spec/cucumber'"
  end
end

if @use_rspec
  append_file "spec/spec_helper.rb" do
    "
# == Email Spec

require 'email_spec'

RSpec::Runner.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
end"
  end
end

@generate ||= {}
@generate[:email_spec] = lambda {
  generate "email_spec:steps" if @use_cucumber
}
