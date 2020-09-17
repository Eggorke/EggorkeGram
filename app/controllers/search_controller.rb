class SearchController < ApplicationController
  before_action :user_signed_in?
  
  def search
    @searched_users = User.find_by_name(params[:name])
  end

  
end
