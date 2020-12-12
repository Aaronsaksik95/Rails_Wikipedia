class Article < ApplicationRecord
    belongs_to :user
  
    default_scope { where(deleted_at: nil) }
    scope :active, -> { where(deleted_at: nil) }
    scope :deleted, -> { where.not(deleted_at: nil) }
  
    def self.all_but_deleted
        Tweet.where(deleted_at: nil)
      end
    
end
