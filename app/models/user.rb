class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 8, maximum: 25} 
    VALID_EMAIL_REGEX = /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
end