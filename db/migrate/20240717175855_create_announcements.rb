class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|
      t.string :brand
      t.string :model
      t.string :car_body
      t.integer :milleage
      t.string :color
      t.integer :price
      t.string :fuel
      t.integer :engine_capacity
      t.integer :year
      t.integer :mobile_number
      t.string :email
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
