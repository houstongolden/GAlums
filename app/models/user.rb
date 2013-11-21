class User < ActiveRecord::Base
  has_many :authentications
  has_one :profile

  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_profile
  	user = User.last
   	profile = Profile.create(contact_email: user.email, user_id: user.id)
  end 

  # Setup accessible (or protected) attributes for your model
  # (Change to Strong Params!) 
  # attr_accessible :email, :password, :password_confirmation, :remember_me

end
