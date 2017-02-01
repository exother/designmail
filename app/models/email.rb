class Email < ApplicationRecord
  has_many :campaign_mails

  validates_uniqueness_of :email

  def self.create_from_csv(file_path)
    file = File.open(file_path, 'r')
    emails = file.read
    created_emails = []
    emails.split(';').each do |email|
      new_mail = Email.new email: email
      if new_mail.save
        created_emails << new_mail
      end
    end
    created_emails
  end
end
