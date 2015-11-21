class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :status
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
