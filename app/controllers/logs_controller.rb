class LogsController < ApplicationController
  before_action :authorized

  # GET /people
  def index
    @logs = Log.all

    render json: @logs
  end
end
