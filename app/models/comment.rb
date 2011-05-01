# == Schema Information
# Schema version: 20110501132657
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  text       :text
#  user_id    :integer
#  request_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  attr_accessible :text

  belongs_to :request
  belongs_to :user

  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :request_id, :presence => true

  default_scope :order => 'comments.created_at DESC'
end
