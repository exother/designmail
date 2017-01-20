

task :send_mails => :environment do
  CampaignMail.limit(10).update status:1
end