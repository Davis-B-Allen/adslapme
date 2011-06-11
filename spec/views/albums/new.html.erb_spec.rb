require 'spec_helper'

describe "albums/new.html.erb" do
  before(:each) do
    assign(:album, stub_model(Album,
      :uid => 1,
      :user_id => 1,
      :cover_photo_id => 1
    ).as_new_record)
  end

  it "renders new album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => albums_path, :method => "post" do
      assert_select "input#album_uid", :name => "album[uid]"
      assert_select "input#album_user_id", :name => "album[user_id]"
      assert_select "input#album_cover_photo_id", :name => "album[cover_photo_id]"
    end
  end
end
