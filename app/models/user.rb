class User < ApplicationRecord
    has_many :comments
    has_many :like
    has_many :Post
end
