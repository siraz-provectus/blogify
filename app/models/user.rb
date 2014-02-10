class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :last_name, 
            presence: true, 
            length: { in: 2..40 }

  validates :terms_of_service, 
            acceptance: true 

  has_many :comments, dependent: :destroy
end