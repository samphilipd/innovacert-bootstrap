class InterviewSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :interview_sections
  has_many :interview_questions, inverse_of: :interview_section, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :instrument, presence: true
  # TODO validation and helper methods for automatic section numbering

  ## Explicitly allow setting of observation_questions attributes (i.e. observation_question content fields) through nesting on this model
  accepts_nested_attributes_for :interview_questions, reject_if: lambda {|iq| iq[:content].blank?}, allow_destroy: true
  #
  ## Allow controller to pass switches to add an extra question
  def _add_question=(switch)
    self.add_blank_question if switch == "1"
  end
  def _add_question
    # default is to NOT add a question
    "0"
  end
  def add_blank_question
    interview_questions.create(question_content: "...", sample_answer: "...")
  end

end
