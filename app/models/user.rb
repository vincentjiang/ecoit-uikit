class User < ActiveRecord::Base
	before_save :username_downcase

	attr_reader :password, :password_confirmation
	
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true, length: 6..20, on: :create #只在创建用户时需要对密码进行验证

	def User.authenticate(username, password)
		if user = find_by_username(username)
			if user.password_encrypt == encrypt_password(password)
				user
			end
		end
	end

	def User.encrypt_password(password)
		Digest::SHA2.hexdigest(password + "VincentJiang")
	end

	# 'password' is a virtual attribute
	def password=(password)
		@password = password
		if password.present?
			self.password_encrypt = self.class.encrypt_password(password)
		end
	end

	private
		def username_downcase
			self.username = username.downcase
		end
end