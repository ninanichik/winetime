class User < ActiveRecord::Base
  has_many :wines
  validates :fname, presence: true
  validates :lname, presence: true
  validates :phone, presence: true, uniqueness: true, numericality: { only_integer: true, message: 'Phone number should be correct' }
  validates :email, presence: true, uniqueness: true, format: {with: '/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i'}
end