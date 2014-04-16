class Ucl < ActiveRecord::Base
  has_and_belongs_to_many :workers
  has_many :instruments, dependent: :destroy, inverse_of: :ucl

  ## VALIDATIONS
  validates :code, presence: true
  validates :name, presence: true
  # description is not required for now

  def self.options_for_select
    Ucl.all.map{|s| [s.human_readable_name, s.id] }
  end

  def human_readable_name
    code.to_s + " - " + name
  end
end
