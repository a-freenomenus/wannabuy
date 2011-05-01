class Comment < ActiveRecord::Base
  attr_accessible :text

  belongs_to :request
  belongs_to :user

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :request_id, :presence => true

  default_scope :order => 'comments.created_at DESC'
end
