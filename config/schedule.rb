set :output, "#{Whenever.path}/log/crontab.log"

every 1.minutes do
  command "cd #{Whenever.path} && ruby watch-men.rb"
end
