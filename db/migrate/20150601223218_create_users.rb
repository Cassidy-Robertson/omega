class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
