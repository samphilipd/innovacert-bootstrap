class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_sections, inverse_of: :instrument, dependent: :destroy
  has_many :interview_sections, inverse_of: :instrument, dependent: :destroy

  ## VALIDATIONS
  validates :name, presence: true
  validates :ucl, presence: true  # all instruments must be related to a valid and real UCL

  ## Explicitly allow setting of observation_section attributes (i.e. observation_questions and interview_questions) through nesting on this model
  accepts_nested_attributes_for :observation_sections, reject_if: lambda {|os| os[:name].blank?}, allow_destroy: true
  accepts_nested_attributes_for :interview_sections, reject_if: lambda {|is| is[:name].blank?}, allow_destroy: true

  ## Allow controller to pass switches to add an extra section
  attr_accessor :_add_observation_section
  attr_accessor :_add_interview_section
  before_save do
    self.add_blank_observation_section if @_add_observation_section == "1"
    self.add_blank_interview_section if @_add_interview_section == "1"
    # reset attributes so we don't add sections unless user explicitly sets this switch again
    @_add_observation_section, @_add_interview_section = "0", "0"
  end

  # TODO adding proper numbering support in a helper method makes more sense
  #

  def add_blank_observation_section
    observation_sections.create(name: "...")
  end
  def add_blank_interview_section
    interview_sections.create(name: "...")
  end
end
