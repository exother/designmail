class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :host
      t.string :user
      t.string :password

      t.timestamps
    end
  end
end
