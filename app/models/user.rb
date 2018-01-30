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

  def upvote(post_id)
    return vote(1, post_id)
  end

  def downvote(post_id)
    return vote(-1, post_id)
  end

  private

  def vote(vote_score, voted_item)
    new_vote = self.votes.new
    new_vote.votable = voted_item
    new_vote.score = vote_score
    new_vote.save
  end
end
