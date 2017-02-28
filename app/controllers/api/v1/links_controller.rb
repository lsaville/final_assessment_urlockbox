class Api::V1::LinksController < ActionController::API

  def create
    @link = Link.new link_params
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read, :user_id)
  end
end
