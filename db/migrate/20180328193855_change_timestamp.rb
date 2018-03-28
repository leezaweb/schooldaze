class ChangeTimestamp < ActiveRecord::Migration[5.0]
  def change
    remove_column :registrations, :registration_date
    add_column :registrations, :registered_on, :datetime
  end
end
