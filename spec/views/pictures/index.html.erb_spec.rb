require 'spec_helper'

describe "pictures/index.html.erb" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture,
        :id => "Id",
        :url => "Url"
      ),
      stub_model(Picture,
        :id => "Id",
        :url => "Url"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
