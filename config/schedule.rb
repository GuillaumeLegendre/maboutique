set :output, "#{path}/log/cron.log"

every 1.day, :at => '4:00 am' do
  runner "Contact.send_birthday_mail"
end
