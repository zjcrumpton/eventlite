class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :attendings

  def self.past
    past = []

    Event.all.each do | event |
      past << event if event.time.past?
    end
    past
  end

  def self.future
    future = []

    Event.all.each do | event |
      future << event if event.time.future?
    end
    future
  end

  scope :past, -> { where('time < ?', Date.today)}
  scope :upcoming, -> { where('time >= ?', Date.today) }
end
