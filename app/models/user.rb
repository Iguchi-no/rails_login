class User < ApplicationRecord
    # emailを小文字に統一
    before_save { self.email = email.downcase }
    # emailのフォーマット指定
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    # emailのバリデーション
    validates :email,
        presence: true,
        length: { maximun: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    # passwordのバリデーション
    validates :password,
        presence: true,
        length: { minimun: 6 }
    has_secure_password
end
