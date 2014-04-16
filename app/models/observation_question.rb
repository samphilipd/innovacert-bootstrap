class ObservationQuestion < ActiveRecord::Base
  belongs_to :observation_section, inverse_of: :observation_questions

  ## VALIDATIONS
  validates :content, presence: true
  validates :observation_section, presence: true  # must belong to a valid and real observation_section
  # TODO validation and helper methods for automatic question numbering
end
