class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.float :gpa
    end

    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :salary
    end

    create_table :courses do |t|
      t.string :subject
    end

    create_table :registrations do |t|
      t.integer :student_id
      t.integer :course_id
      t.timestamps
    end


  end
end
