gem "exception_notification"

@generate[:exception_notification] = lambda {
  say("Configure the exception notifier settings in config/environments/production.rb")
  append_file "config/environments/production.rb" do
"

config.middleware.use ExceptionNotifier,
  :email_prefix => '[#{app_name} Exception] ',
  :sender_address => %{'Exception Notifier' <support@example.com>},
  :exception_recipients => %w{you@example.com}
"
  end
}