class CreateEinladencodes < ActiveRecord::Migration[7.0]
  def change
    create_table :einladencodes do |t|
      t.text :code
      t.boolean :used, default: false


      t.timestamps
    end
  end
end
