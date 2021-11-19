class Wines < ActiveRecord::Base
  belongs_to :user
  validates :produced_year, numericality: { only_integer: true }

end