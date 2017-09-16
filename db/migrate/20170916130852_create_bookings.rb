class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :model
      t.text :content

      t.timestamps
    end
  end
end
