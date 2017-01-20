

task :send_mails => :environment do
  CampaignMail.last(10).update status:1
end