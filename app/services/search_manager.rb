# frozen_string_literal: true

class SearchManager
  attr_reader :search_result

  def initialize(params)
    @search_params = params
  end

  def call
    search_result = User.find_by_name(@search_params)
  end
end
