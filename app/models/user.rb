require 'mail'
class User < ApplicationRecord
    before_save :downcase_email

  private
    def downcase_email
        self.email = email.downcase
      end
    
    has_secure_password
    validates :email, length: { minimum: 5 },  presence: [true,"email is require"] , format: { with: URI::MailTo::EMAIL_REGEXP , message: "only allows letters"} 
    validates :password, length: {minimum: 5,message:"too short password"}
end
