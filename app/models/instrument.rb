class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_sections, inverse_of: :instrument, dependent: :destroy
  validates :name, presence: true
  # all instruments must be related to a valid and real UCL
  validates :ucl, presence: true

  accepts_nested_attributes_for :observation_sections, reject_if: lambda {|os| os[:name].blank?}, allow_destroy: true

  # for some reason calling #each on a nested form returns values in reverse order,
  # this method is provided as a helper for views in displaying the order correctly.
  def observation_sections_ordered
    observation_sections.reverse
  end
end
