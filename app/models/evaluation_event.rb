class EvaluationEvent < ActiveRecord::Base
  belongs_to :worker, inverse_of: :evaluation_event
  belongs_to :instrument, inverse_of: :evaluation_event

  validates :instrument, presence: true
  validates :worker, presence: true
  validates :evaluation_date, presence: true
end
