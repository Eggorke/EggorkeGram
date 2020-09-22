# frozen_string_literal: true

module FollowHelper
  def basic_redirect
    redirect_to request.referer
  end
end
