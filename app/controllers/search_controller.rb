class SearchController < ApplicationController
  def index
    @poems = SearchFacade.get_poems(search_params)
  end

  private

  def search_params
    params.permit(:author)
  end
end
