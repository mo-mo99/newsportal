class SettingController < ApplicationController

  def show
    @apis = Setting.find_by(user_id: current_user.id).api
    @tags = Setting.find_by(user_id: current_user.id).tags
    @categories = News.distinct.pluck(:category)
  end
  
  def update
    current_api = []
    current_api.append('mediastack') unless setting_params[:mediastack] != "1"
    current_api.append('currentsapi') unless setting_params[:currentsapi] != "1"
    current_tags = []
    params.keys.map do |key|
      current_tags.append(key) unless params[key] != "1" || key == "mediastack" || key == "currentsapi"
    end
    setting = Setting.find_by(user_id: current_user.id)
    setting.update!(api: current_api, user_id: current_user.id, tags: current_tags)
   
  end

  private
  def setting_params
   params.permit(:mediastack, :currentsapi)
  end
end