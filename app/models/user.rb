class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :loans
  has_many :games, :through => :loans

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :isadmin, :integer, default: 0
  
  def self.search(query)
    where("LOWER(email) like ?", "%#{query}%")
   end
end
