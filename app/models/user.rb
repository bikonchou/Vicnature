class User < ActiveRecord::Base
	has_secure_password
	before_save {self.login_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)}
	validates :name, presence: true, length: {maximum: 15}
	validates :account, presence: true, length: {maximum: 15}, uniqueness: true
end
