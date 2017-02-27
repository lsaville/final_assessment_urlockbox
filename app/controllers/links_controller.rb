class LinksController < ApplicationController
  before_action :authorize

  def index
    @hot_links = Link.hot
    @user_links = current_user.links
  end

  def edit
    @link = Link.find(params[:id])
  end
end
