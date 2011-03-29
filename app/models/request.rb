# == Schema Information
# Schema version: 20110327154937
#
# Table name: requests
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)     default("not-started"), not null
#  category_id :integer
#  city        :string(255)
#

class Request < ActiveRecord::Base
  attr_accessible :name, :description, :city, :category_id

  belongs_to :user
  belongs_to :category

  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true
  validates :user_id, :presence => true

  default_scope :order => 'requests.created_at DESC'  
end
