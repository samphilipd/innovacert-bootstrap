class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_questions, dependent: :destroy

  accepts_nested_attributes_for :observation_questions
end
