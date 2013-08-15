class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
  end

  def create
    @css = DryCss::CSS.new(params[:url])
    @content = @css.colors
    @treemap = {:name => 'flare', :children => []}
    @content[:counts].map{|k,v| @treemap[:children].push({'name' => k[-1,1] == ';' ? k[0, k.size-1] : k, 'size' => v})}
    render 'colormaps/show'
  end

  def show
    @css = DryCss::CSS.new(params[:url])
    respond_with @css.colors
  end
end
