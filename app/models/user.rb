class User < ApplicationRecord
<<<<<<< HEAD
    has_many :articles
=======
    validates :email, presence: true, uniqueness: true
>>>>>>> 98bc0ac5c0f602df6ff23bb4c21430fc349d87d4
end
