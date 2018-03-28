class AddingColumnsCourseRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :cost, :integer
    add_column :courses, :pay, :integer
    add_column :registrations, :grade, :integer
  end
end
