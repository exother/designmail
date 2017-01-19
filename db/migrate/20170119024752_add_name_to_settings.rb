class AddNameToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :name, :string
  end
end
