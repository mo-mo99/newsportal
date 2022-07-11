# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :eligable?, only: %i(setting profile)

  def index
  end

  def profile
  end

  def setting
  end

  private

  def eligable?
    redirect_to "/" if current_user.blank?
  end
end
