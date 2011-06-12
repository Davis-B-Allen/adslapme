require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :uid => 1,
      :first_name => "First Name",
      :last_name => "Last Name",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
