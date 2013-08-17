class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
    @map_for_form = Colormap.new
    @map = Colormap.first
  end

  def create
    @map = Colormap.find_by_uri(params[:colormap][:uri]) || Colormap.create(post_params)
    if !@map.changed? ||  @map.save
      render 'colormaps/show'
    else
      redirect_to :index
    end
  end

  def show
    @map = Colormap.find(params[:id])
    respond_with @map
  end

  private

  def post_params
    params.require(:colormap).permit(:uri)
  end

end
