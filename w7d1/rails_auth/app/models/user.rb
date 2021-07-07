class User < ApplicationRecord
    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, length: {in:6..20, message: "password cannot be left blank"}, allow_nil: true 
    
end
