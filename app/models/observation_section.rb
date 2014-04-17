class ObservationSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :observation_sections
  has_many :observation_questions, inverse_of: :observation_section, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :instrument, presence: true # must belong to a valid and present instrument
  # TODO validation and helper methods for automatic section numbering

  ## Explicitly allow setting of observation_questions attributes (i.e. observation_question content fields) through nesting on this model
  accepts_nested_attributes_for :observation_questions, reject_if: lambda {|oq| oq[:content].blank?}, allow_destroy: true

  # TODO implement proper number ordering for questions in a helper method

  ## Allow controller to pass switches to add an extra question
  def _add_question=(switch)
    self.add_blank_question if switch == "1"
  end
  def _add_question
    # default is to NOT add a question
    "0"
  end
  def add_blank_question
    observation_questions.create(content: "...")
  end
end
