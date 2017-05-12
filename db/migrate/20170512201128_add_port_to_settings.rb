class AddPortToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :port, :integer
  end
end
