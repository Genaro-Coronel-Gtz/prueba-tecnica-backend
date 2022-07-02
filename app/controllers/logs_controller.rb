class LogsController < ApplicationController
  before_action :authorized

  # GET /people
  def index
    user = logged_in_user
    logs = user.log

    render json: logs
  end
end
