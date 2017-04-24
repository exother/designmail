class Email < ApplicationRecord
  has_many :campaign_mails
  validates_uniqueness_of :email
  validates_format_of :email,:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.create_from_csv(file_path)
    file = File.open(file_path, 'r')
    created_emails = []
    file.each_line do |email|
      email.strip!
      new_mail = Email.new email: email
      if new_mail.save
        created_emails << new_mail
      end
    end
    created_emails
  end
end
