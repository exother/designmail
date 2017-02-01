class AddFieldsToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :subject, :string
    add_column :campaigns, :from_name, :string
    add_column :campaigns, :from_email, :string
  end
end
