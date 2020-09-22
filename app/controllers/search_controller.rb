# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :user_signed_in?
  before_action :redirect_if_not_log_in

  def search
    @searched_users = User.find_by_name(params[:name])
  end
end
