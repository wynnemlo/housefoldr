class PagesController < ApplicationController
  def front
    redirect_to home_path if user_signed_in?
  end

end