class User < ActiveRecord::Base

  def facebook_profile_url
    "http://graph.facebook.com/#{self.uid}/picture"
  end
  
  def facebook_graph
    Koala::Facebook::GraphAPI.new(self.facebook_token)
  end

end
