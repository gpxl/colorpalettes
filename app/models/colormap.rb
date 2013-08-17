class Colormap < ActiveRecord::Base
  validates_presence_of :uri
  serialize :treemap

  before_save :get_attrs

  def name
    self.uri[/[\w]+.[\w]+$/].capitalize
  end

  private

  def get_attrs
    @site = DryCss::Site.new(uri)
    @css = DryCss::CSS.new(*@site.uris)
    self.color_count = @css.colors[:counts].count
    self.reference_count = @css.colors[:total]
    self.treemap = {:name => 'flare', :children => []}
    @css.colors[:counts].map{|k,v| self.treemap[:children].push({'name' => k[-1,1] == ';' ? k[0, k.size-1] : k, 'size' => v})}
  end

end
