class ObservationSection < ActiveRecord::Base
  has_many :observation_questions
  belongs_to :instrument
end
