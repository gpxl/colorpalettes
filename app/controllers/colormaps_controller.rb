class ColormapsController < ApplicationController
  respond_to :html, :json

  def index
  end

  def create
    @css = DryCss::CSS.new(params[:url])
    @content = @css.colors
    render 'colormaps/show'
  end

  def show
    @css = DryCss::CSS.new(params[:url])
    respond_with @css.colors
  end
end
