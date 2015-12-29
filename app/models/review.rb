class Review < ActiveRecord::Base
  belongs_to :plant
  belongs_to :user

  validates :title, :body, :presence => {message: "Error"}
end
