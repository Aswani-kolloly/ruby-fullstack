namespace :sample do
  desc "cron job"
  task test: :environment do
    puts 'Hi cron'
  end

end
