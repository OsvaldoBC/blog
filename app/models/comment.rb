class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :increment_post_comments_counter
  after_destroy :decrement_comment_counter

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
