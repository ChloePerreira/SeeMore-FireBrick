class AddLocalIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :local_id, :string
  end
end
