class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
end
