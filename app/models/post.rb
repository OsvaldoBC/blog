class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_user_posts_counter
  after_destroy :decrement_post_counter

  def increment_user_posts_counter
    user.increment!(:posts_counter)
  end

  def decrement_post_counter
    user.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
