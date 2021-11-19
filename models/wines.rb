class Wines < ActiveRecord::Base
  belongs_to :user
  validates :produced_year, numericality: { only_integer: true }
  validates :name, presence: true
  validates :name, :produced_place, length: { minimum: 2, message: 'Minimum 2 letters required' }
  validates :name, :produced_place, length: {maximum: 200, message: 'Maximum 500 letters'}
end