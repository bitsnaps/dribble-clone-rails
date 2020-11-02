class AddShotIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :shot_id, :integer
  end
end
