class AddPunkteToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :punkte, :integer

  end
end
