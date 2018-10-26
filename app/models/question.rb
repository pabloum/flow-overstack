# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  description :text
#  user_id     :integer
#

class Question < ApplicationRecord
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
