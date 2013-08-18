class ListsController < ApplicationController
  def index
    @maps = Colormap.find(:all, :order => "slug")
  end
end
