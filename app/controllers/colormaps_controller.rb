class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
    @maps = Colormap.find(:all, :order => "id desc", :limit => 20)
  end

  def create
    @map = Colormap.find_by_uri(params[:colormap][:uri]) || Colormap.create(post_params)
    if !@map.changed? ||  @map.save
      redirect_to @map
    else
      @uri_alt = @map.uri[4] == ':' ? @map.uri.sub(':','s:') : @map.uri.sub('s','')
      flash[:notice] = "CSS could not be parsed at #{@map.uri}. Try again with #{@uri_alt}"
      redirect_to :root
    end
  end

  def show
    @map = Colormap.friendly.find(params[:id])
    respond_with @map
  end

  private

  def post_params
    params.require(:colormap).permit(:uri)
  end

end
