require 'spec_helper'

describe "pictures/edit.html.erb" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :id => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path(@picture), :method => "post" do
      assert_select "input#picture_id", :name => "picture[id]"
      assert_select "input#picture_url", :name => "picture[url]"
    end
  end
end
