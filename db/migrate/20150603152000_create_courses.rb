class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :topic
      t.references :teacher, index: true

      t.timestamps null: false
    end
  end
end
