class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall
end
