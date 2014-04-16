class InterviewSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :interview_sections
  has_many :interview_questions, inverse_of: :interview_section, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :instrument, presence: true
  # TODO validation and helper methods for automatic section numbering
end
