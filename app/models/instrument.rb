class Instrument < ActiveRecord::Base
  belongs_to :ucl
  has_many :observation_sections, dependent: :destroy

  accepts_nested_attributes_for :observation_sections, reject_if: lambda {|os| os[:name].blank?}, allow_destroy: true

  # for some reason calling #each on a nested form returns values in reverse order,
  # this method is provided as a helper for views in displaying the order correctly.
  def observation_sections_ordered
    observation_sections.reverse
  end
end
