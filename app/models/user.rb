class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id
  has_many :attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :attendings

  def upcoming_events
    upcoming_events = []
    self.events.each do | event |
      upcoming_events << event if event.time.future?
    end
    upcoming_events
  end

  def previous_events
    prev_events = []
    self.events.each do | event |
      prev_events << event if event.time.past?
    end
    prev_events
  end
end
