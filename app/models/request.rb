# == Schema Information
# Schema version: 20110326151600
#
# Table name: requests
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Request < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true
  validates :user_id, :presence => true

  default_scope :order => 'requests.created_at DESC'  
end
