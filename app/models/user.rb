class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy # 유저가 삭제되면 아티클도 전부 삭제 
	before_save { self.email = email.downcase }


	validates :username, presence: true, 
			   length: { minimum: 3, maximum: 25 }, 
			   uniqueness: { case_sensitive: false }

    
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
    			length: { minimum: 1, maximum: 50},
    			uniqueness: {case_sensitive: false},
    			format: { with: VALID_EMAIL_REGEX }

	has_secure_password # 원래 있는 메쏘드


end
