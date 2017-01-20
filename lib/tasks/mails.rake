namespace :mails do
  task :send => :environment do
    CampaignMail.last(10).update status:1
  end
end
