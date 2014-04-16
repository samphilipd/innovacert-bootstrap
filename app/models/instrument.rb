class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_sections, inverse_of: :instrument, dependent: :destroy
  has_many :interview_sections, inverse_of: :instrument, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :ucl, presence: true  # all instruments must be related to a valid and real UCL

  ## Explicitly allow setting of observation_section attributes (i.e. observation_questions) through nesting on this model
  accepts_nested_attributes_for :observation_sections, reject_if: lambda {|os| os[:name].blank?}, allow_destroy: true

  # for some reason calling #each on a nested form returns values in reverse order,
  # this method is provided as a helper for views in displaying the order correctly.
  # FIXME this should not be necessary, adding proper numbering support in a helper method makes more sense
  def observation_sections_ordered
    observation_sections.reverse
  end
end
