# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  password_digest :string
#  name            :string(100)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password validations: false

  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable

  validates :name, presence: true
  validates :email, uniqueness: true, format: /@/
  validates :password, presence: true, on: :create
  validates :password, length: { in: 6..20 }, allow_nil: true
end
