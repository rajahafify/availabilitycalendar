class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :email, null: false
      t.string :name
      t.string :contact_no
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.timestamps null: false
    end
  end
end
