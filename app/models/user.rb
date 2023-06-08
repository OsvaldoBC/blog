class User < ApplicationRecord
    has_many :comments
    has_many :like
    has_many :Post, foreign_key: :author_id

    def recent_posts
        Post.order(created_at: :desc).limit(3)
    end
end
