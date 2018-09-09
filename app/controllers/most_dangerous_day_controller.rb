class MostDangerousDayController < ApplicationController
  def index
    @presenter = SearchPresenter.new(params[:start_date], params[:end_date])
  end
end
