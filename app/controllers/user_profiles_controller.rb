class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  expose(:user) { current_user }
  expose(:reviews) { user.last_reviews }

  def show
  end
  
  def user_reviews
    self.reviews = user.reviews
    render 'show'
  end
end
