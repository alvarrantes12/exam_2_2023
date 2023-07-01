class Country < ApplicationRecord

  validates :name, presence: :true
  validates :fact, presence: :true
end
