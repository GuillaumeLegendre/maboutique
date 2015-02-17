set :output, "#{path}/log/cron.log"

every 1.minutes do
  runner "Contact.send_birthday_mail"
end
