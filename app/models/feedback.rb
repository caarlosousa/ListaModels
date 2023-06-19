class Feedback < ApplicationRecord
  belongs_to :post
  validates :like, inclusion: [true, false]
end
