# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Answer < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  belongs_to :question
  belongs_to :user

  validates :content, presence: true
end
