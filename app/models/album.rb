class Album < ActiveRecord::Base

  has_many :pictures
  belongs_to :user

  validates_uniqueness_of :uid

end
