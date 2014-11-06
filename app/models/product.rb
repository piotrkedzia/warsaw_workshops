class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :description, presence: true
  validates :price, presence: true,
                    format: { :with => /\A\d+(?:\.\d{0,2})?\z/  }
                   #numericality: {greater_than_or_equal_to: 0.01},
  validates :title, presence: true

  def average_rating
     reviews.average(:rating)
  end
end
