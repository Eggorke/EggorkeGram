# frozen_string_literal: true

class IndexController < ApplicationController
  def home
    @posts = Post.where(user_id: current_user.id) if user_signed_in?
  end
end
