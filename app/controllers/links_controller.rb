class LinksController < ApplicationController
  before_action :authorize

  def index
    @user_links = current_user.links
  end

  def edit
    @link = Link.find(params[:id])
  end
end
