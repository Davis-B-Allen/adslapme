class User < ActiveRecord::Base

  def facebook_profile_url
    "http://graph.facebook.com/#{self.uid}/picture"
  end

end
