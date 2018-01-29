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
    # get self post obj
    # build a vote obj with score 1
    # tag it to the current_user
    return vote(1, post_id) if can_vote?

    p 'cannot vote anymore'
  end

  def downvote(post_id)
    # same like upvote
    # build a vote obj with score -1
    return vote(-1, post_id) if can_vote?

    p 'cannot vote anymore'
  end

  def can_vote?
    current_votes = self.votes #votes from the user

    return true if current_votes.empty?
    vote_count_by_current_user = current_votes.where(votable_id: self.id, votable_type: 'Post').count

    if vote_count_by_current_user == 0
      return true
    else
      return false
    end
  end

  def disable_vote?
    return true if can_vote?
  end

  private

  def vote(vote_score, voted_post)
    new_vote = self.votes.new
    new_vote.votable_id = voted_post.id
    new_vote.votable_type = 'Post'
    new_vote.score = vote_score
    new_vote.save
  end
end
