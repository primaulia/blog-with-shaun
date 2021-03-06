class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :creator, class_name: 'User' #ref to user

  has_many :votes, as: :votable
end
