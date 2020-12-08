class User < ApplicationRecord
    has_many :articles
    validates :email, presence: true, uniqueness: true
end
