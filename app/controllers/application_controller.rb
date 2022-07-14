# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authorize_user
    redirect_to "/" unless current_user.admin?
  end
end
