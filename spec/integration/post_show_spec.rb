require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Osvaldo',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://unsplash.com/photos/iR3dtvKmwAw',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Christopher',
      bio: 'FullStack Dev',
      photo: 'https://unsplash.com/photos/hodKTZow_Kk',
      posts_counter: 3
    )

    @post1 = Post.create(
      author_id: @user1.id,
      title: 'Test',
      text: 'First Post',
      comments_counter: 1,
      likes_counter: 1
    )

    @comment1 = Comment.create(
      text: 'First Comment',
      post_id: @post1.id,
      user_id: @user1.id
    )

    @like1 = Like.create(
      post_id: @post1.id,
      user_id: @user1.id
    )
  end


end