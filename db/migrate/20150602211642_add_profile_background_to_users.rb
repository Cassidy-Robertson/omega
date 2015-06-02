class AddProfileBackgroundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_background, :string
  end
end
