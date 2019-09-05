class CreateEventAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendees do |t|
      t.integer :number_of_guests
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :rsvp
      t.integer :number_of_guests
    end
  end
end
