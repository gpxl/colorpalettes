require 'spec_helper'

describe Colormap do
  before do
    @colormap = Colormap.create(uri: 'http://colorpalettes.gerlandopiro.com')
  end

  it "creates a history record when it is saved" do
    @colormap.histories.last.color_count.should eq @colormap.color_count
    @colormap.histories.last.reference_count.should eq @colormap.reference_count
  end

  it "deletes history records when destroyed" do
    id = @colormap.id
    @colormap.destroy
    History.find_by_colormap_id(id).should be_nil
  end
end
