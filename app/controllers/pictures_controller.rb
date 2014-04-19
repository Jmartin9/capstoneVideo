class PicturesController < ApplicationController

  def create
    @poi = Poi.find(params[:poi_id])
    @picture = @poi.pictures.create(pic_params)
    #@picture = Picture.new(pic_params)
    redirect_to poi_path(@poi)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
     params.require(:picture).permit(:title, :picture,:approved)
    end


end
