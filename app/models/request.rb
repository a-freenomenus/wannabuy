# == Schema Information
# Schema version: 20110501132657
#
# Table name: requests
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)     default("not-started"), not null
#  category_id :integer
#  city        :string(15)
#

class Request < ActiveRecord::Base
  attr_accessible :name, :description, :city, :category_id, :status, :criterions_attributes

  belongs_to :user
  belongs_to :category
  has_many :responses
  has_many :criterions
  has_many :comments
  
  accepts_nested_attributes_for :criterions, 
    :allow_destroy => true, 
    :reject_if => proc { |attrs| p attrs; attrs['name'].blank? }


  validates :name, :presence => true, :length => { :maximum => 200 }
  validates :description, :presence => true
  validates :user_id, :presence => true

  default_scope :order => 'requests.created_at DESC'  
end
