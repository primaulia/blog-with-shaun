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
    vote(1)
  end

  def downvote
    # same like upvote
    # build a vote obj with score -1
    vote(-1) if can_vote?
  end

  def can_vote?
    # get current_user
    # if current_user has vote for self (post obj)
    # return false
    # else
    # return true
  end

  private

  def vote(vote_score)
    new_vote = self.votes.new
    new_vote.user = User.first
    new_vote.score = vote_score
    new_vote.save
  end

end
