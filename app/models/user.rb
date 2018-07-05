class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
