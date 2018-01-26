class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :tags
  has_many :votes, as: :votable

  def self.test
    p 'test test test'
  end

  def upvote
    # get self post obj
    # build a vote obj with score 1
    # tag it to the current_user
    return vote(1) if can_vote?

    p 'cannot vote anymore'
  end

  def downvote
    # same like upvote
    # build a vote obj with score -1
    return vote(-1) if can_vote?

    p 'cannot vote anymore'
  end

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

  private

  def vote(vote_score)
    new_vote = self.votes.new
    new_vote.user = current_user
    new_vote.score = vote_score
    new_vote.save
  end

end
