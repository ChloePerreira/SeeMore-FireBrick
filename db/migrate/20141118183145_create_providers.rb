class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :user_id
      t.string :uid

      t.timestamps
    end
  end
end
