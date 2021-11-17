class User < ApplicationRecord
    attr_accessor :password
    has_one_attached :profile_image

    before_save :encrypt_password

    def self.authenticate(email,password)
        user = find_by_email(email)
        return user if user && user.password_valid?(password)
    end

    def password_valid?(password)
        self.hashed_password == encrypt(password)
    end

    private
     def encrypt_password
        return if password.blank?
        self.hashed_password = encrypt(password)
     end

     def encrypt(string)
        Digest::SHA1.hexdigest(string)
     end
end
