class EvaluationEvent < ActiveRecord::Base
  belongs_to :worker, inverse_of: :evaluation_event
  belongs_to :instrument, inverse_of: :evaluation_event
end
