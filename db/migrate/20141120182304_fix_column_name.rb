class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :type, :media
  end
end
