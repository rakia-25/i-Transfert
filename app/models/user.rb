class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :guichets

  enum :role, {admin:"admin", agent:"agent"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
