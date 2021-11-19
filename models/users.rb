class User < ActiveRecord::Base
  has_many :wines
  validates :fname, presence: true
  validates :lphone, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end