class HomeController < ApplicationController
  def top
    redirect_to travels_path if user_signed_in?
  end
end
