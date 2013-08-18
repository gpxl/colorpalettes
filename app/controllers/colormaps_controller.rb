class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
    @new_map = Colormap.new
    @maps = Colormap.find(:all, :order => "id desc", :limit => 5).reverse
  end

  def create
    @map = Colormap.find_by_uri(params[:colormap][:uri]) || Colormap.create(post_params)
    if !@map.changed? ||  @map.save
      redirect_to @map
    else
      redirect_to :index
    end
  end

  def show
    @new_map = Colormap.new
    @map = Colormap.friendly.find(params[:id])
    respond_with @map, @new_map
  end

  private

  def post_params
    params.require(:colormap).permit(:uri)
  end

end
