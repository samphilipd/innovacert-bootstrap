class InterviewSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :interview_sections
  has_many :interview_questions, inverse_of: :interview_section, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :instrument, presence: true
  # TODO validation and helper methods for automatic section numbering

  ## Explicitly allow setting of observation_questions attributes (i.e. observation_question content fields) through nesting on this model
  accepts_nested_attributes_for :interview_questions, reject_if: lambda {|iq| iq[:content].blank?}, allow_destroy: true
end
