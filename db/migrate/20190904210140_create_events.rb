class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :address
      t.references :user, foreign_key: true
      t.string :type
      t.boolean :food
      t.boolean :booze
      t.string :restrictions
    end
  end
end
