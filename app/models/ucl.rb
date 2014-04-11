class Ucl < ActiveRecord::Base
  has_and_belongs_to_many :workers
  has_many :instruments, dependent: :destroy

  def self.options_for_select
    Ucl.all.map{|s| [s.code.to_s + " - " + s.name, s.id] }
  end
end
