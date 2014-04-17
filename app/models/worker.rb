class Worker < ActiveRecord::Base
  has_and_belongs_to_many :ucls
  has_many :evaluation_events, inverse_of: :worker

  ## VALIDATIONS
  validates :name, presence: true
  validates :rut, presence: true
  validates :email_address, presence: true
  validates_format_of :email_address, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_with RutValidator

end
