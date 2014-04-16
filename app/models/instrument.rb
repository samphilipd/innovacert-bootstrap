class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_sections, inverse_of: :instrument, dependent: :destroy
  has_many :interview_sections, inverse_of: :instrument, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :ucl, presence: true  # all instruments must be related to a valid and real UCL

  ## Explicitly allow setting of observation_section attributes (i.e. observation_questions) through nesting on this model
  accepts_nested_attributes_for :observation_sections, reject_if: lambda {|os| os[:name].blank?}, allow_destroy: true

  # TODO adding proper numbering support in a helper method makes more sense
end
