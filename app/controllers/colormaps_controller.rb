class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
    @maps = Colormap.find(:all, :order => "id desc", :limit => 20)
  end

  def create
    strip_trailing_forward_slash
    @map = Colormap.find_by_uri(params[:colormap][:uri]) || Colormap.create(post_params)
    if !@map.changed? ||  @map.save
      redirect_to @map
    else
      @uri_alt = @map.uri[4] == ':' ? @map.uri.sub(':','s:') : @map.uri.sub('s','')
      flash[:notice] = "CSS could not be parsed at #{@map.uri}. Try again with #{@uri_alt}"
      redirect_to :root
    end
  end

  def update
    @map = Colormap.friendly.find(params[:id])
    if @map.save
      redirect_to @map
    else
      flash[:notice] = "Map could not be updated :("
      redirect_to @map
    end
  end

  def show
    @map = Colormap.friendly.find(params[:id])
    respond_with @map
  end

  private

  def strip_trailing_forward_slash
    params[:colormap][:uri].gsub!(/\/$/,'')
  end

  def post_params
    params.require(:colormap).permit(:uri)
  end

end
