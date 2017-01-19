class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :content
      t.integer :status
      t.references :setting, foreign_key: true

      t.timestamps
    end
  end
end
