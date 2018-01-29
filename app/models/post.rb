class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :tags
  has_many :votes, as: :votable

  def can_vote?
    current_votes = current_user.votes #votes from the user

    return true if current_votes.empty?
    vote_count_by_current_user = current_votes.where(votable_id: self.id, votable_type: 'Post').count

    if vote_count_by_current_user == 0
      return true
    else
      return false
    end
  end

  def upvote_count
    #
  end

  def downvote_count
    #
  end

end
