class Answer < ApplicationRecord
  validates :question_type, uniqueness: true
end
