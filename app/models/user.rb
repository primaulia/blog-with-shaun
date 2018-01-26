class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments_made, foreign_key: "creator_id",
                           class_name: "Comment"
  has_many :comments, through: :posts
  has_many :votes
end
