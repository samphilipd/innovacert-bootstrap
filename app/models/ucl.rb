class Ucl < ActiveRecord::Base
  has_and_belongs_to_many :workers
  has_many :instruments, dependent: :destroy
end
