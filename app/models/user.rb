class User < ActiveRecord::Base

	has_secure_password

	has_many :articles

	validates_presence_of :first_name, :last_name, :email, :password_confirmation

end
