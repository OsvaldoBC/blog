class Post < ApplicationRecord
    has_many :comments
    has_many :like
end
