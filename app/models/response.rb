# == Schema Information
# Schema version: 20110402190613
#
# Table name: responses
#
#  id          :integer         not null, primary key
#  description :string(255)
#  user_id     :integer
#  request_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Response < ActiveRecord::Base
  attr_accessible :description

  belongs_to :request
  # belongs_to :user

  validates :description, :presence => true
  validates :user_id, :presence => true
  validates :request_id, :presence => true

  default_scope :order => 'responses.created_at DESC'
end
