class AddUserShotToShots < ActiveRecord::Migration
  def change
    add_column :shots, :user_shot, :string
  end
end
