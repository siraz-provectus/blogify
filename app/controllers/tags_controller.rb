class TagsController < ApplicationController

  before_action :authenticate_user!, :require_to_be_admin!

  expose(:tags) {
    ActsAsTaggableOn::Tag.autocomplete_data(params[:q])
  }

  def autocomplete
    render json: tags, root: false 
  end
end