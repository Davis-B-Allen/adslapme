require 'spec_helper'

describe "pictures/new.html.erb" do
  before(:each) do
    assign(:picture, stub_model(Picture,
      :id => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path, :method => "post" do
      assert_select "input#picture_id", :name => "picture[id]"
      assert_select "input#picture_url", :name => "picture[url]"
    end
  end
end
