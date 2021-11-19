class User < ActiveRecord::Base
  has_many :wines
  validates :fname, presence: true
  validates :lphone, presence: true, uniqueness: true, numericality: { only_integer: true, message: 'Phone number should be correct' }
  validates :email, presence: true, uniqueness: true
end