# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  description :text
#

class Question < ApplicationRecord
end
