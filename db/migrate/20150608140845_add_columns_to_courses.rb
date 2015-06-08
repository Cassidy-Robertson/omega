class AddColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :date, :date
    add_column :courses, :time, :time
    add_column :courses, :street, :string
    add_column :courses, :city, :string
    add_column :courses, :state, :string
    add_column :courses, :zipcode, :string
    add_column :courses, :description, :text
    add_column :courses, :duration, :float
  end
end
