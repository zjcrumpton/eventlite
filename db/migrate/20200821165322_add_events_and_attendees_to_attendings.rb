class AddEventsAndAttendeesToAttendings < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendings, :attendee, references: :users, index: true
    add_foreign_key :attendings, :users, column: :attendee_id
    add_reference :attendings, :attended_event, references: :events, index: true
    add_foreign_key :attendings, :events, column: :attended_event_id
  end
end
