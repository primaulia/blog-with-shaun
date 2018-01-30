class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :tags
  has_many :votes, as: :votable

  def can_vote?(current_user)
    current_votes = self.votes #votes from the user
    return true if current_votes.empty?

    return false if current_votes.includes(:user).where(user: current_user.id).count

    true
  end

  def upvote_count
    vote_counter(1)

  end

  def downvote_count
    vote_counter(-1).abs
  end

  private

  def vote_counter(score_cat)
    self.votes.where(score:score_cat).sum(:score)
  end
end
