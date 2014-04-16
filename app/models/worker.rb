class Worker < ActiveRecord::Base
  has_and_belongs_to_many :ucls

  ## VALIDATIONS
  validates :name, presence: true
  validates :rut, presence: true
  validates_with RutValidator

end
