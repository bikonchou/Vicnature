class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true, length: {maximum: 15}
	validates :account, presence: true, length: {maximum: 15}, uniqueness: true
end
