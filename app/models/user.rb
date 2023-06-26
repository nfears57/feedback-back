class User < ApplicationRecord
    has_secure_password
    has_many :applications, dependent: :destroy
end
