class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, :user_id, :rating, presence: true
end
