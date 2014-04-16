class InterviewQuestion < ActiveRecord::Base
  belongs_to :interview_section, inverse_of: :interview_questions

  ## VALIDATIONS
  validates :question_content, presence: true
  validates :sample_answer, presence: true
  validates :interview_section, presence: true
end
