class ObservationSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :observation_sections
  has_many :observation_questions, inverse_of: :observation_section, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :instrument, presence: true # must belong to a valid and present instrument
  # TODO validation and helper methods for automatic section numbering

  ## Explicitly allow setting of observation_questions attributes (i.e. observation_question content fields) through nesting on this model
  accepts_nested_attributes_for :observation_questions, reject_if: lambda {|oq| oq[:content].blank?}, allow_destroy: true

  # FIXME this is a hack and should not be necessary. Remove the method below and 
  # implement proper number ordering for questions in a helper method
  def observation_questions_ordered
    observation_questions.reverse
  end
end
