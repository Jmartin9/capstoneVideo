class PagesController < ApplicationController
  def admin
    @poi = Poi.all
    @user = User.all
  end
  def not_found
    render
  end
end
