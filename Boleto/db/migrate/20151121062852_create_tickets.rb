class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :t_id
      t.string :event_id
      t.float :price
      t.string :seller_id

      t.timestamps null: false
    end
  end
end
