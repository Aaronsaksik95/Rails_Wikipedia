class Article < ApplicationRecord
    belongs_to :user

    def self.all_but_deleted
        Tweet.where(deleted_at: nil)
      end
    
end
