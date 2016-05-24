class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_length_of :message, minimum: 5, maximum: 10000, allow_blank: false
end
