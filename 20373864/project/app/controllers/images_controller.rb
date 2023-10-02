# app/controllers/images_controller.rb
class ImagesController < ApplicationController
  def show
    @image = ActiveStorage::Blob.find_by_key(params[:id])
  end
end
