class Article < ApplicationRecord
    belongs_to :user
    has_many :historicals
    has_and_belongs_to_many :usertags
    before_save :update_usertags
    after_save  :notify_usertags


    def update_usertags
        self.usertags = extract_usertags
    end

    def notify_usertags
      for tag in self.usertags
        user = tag.user
        TagMailer.with(user: user).notif_tag.deliver_later
      end
    end

    private

    def find_user_by_mention(mention)
        username = mention.delete_prefix('@')
        mentionned_user = User.find_by(username: username)
        if mentionned_user
          fetched = Usertag.find_by(user_id: mentionned_user.id)
          return fetched || Usertag.create(user: mentionned_user)
        end
      end
    
      def extract_usertags
        content.split(' ').filter do |word|
          word.start_with?('@')
        end.map do |mention|
          find_user_by_mention(mention)
        end.filter do |user|
          user != nil
        end
      end
end
