class HistoryController < ApplicationController
  before_action :authenticate_user!
  def index
    @histories = VisitHistory.user(current_user.id).order(:updated_at => :desc).page(params[:page]).per(20)

  end
end
