set :output, "#{Whenever.path}/log/crontab.log"

every 30.minutes do
  command "cd #{Whenever.path} && ruby watch-men.rb"
end
