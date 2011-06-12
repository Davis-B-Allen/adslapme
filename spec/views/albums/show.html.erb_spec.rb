require 'spec_helper'

describe "albums/show.html.erb" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :uid => 1,
      :user_id => 1,
      :cover_photo_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
