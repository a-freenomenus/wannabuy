# == Schema Information
# Schema version: 20110501132657
#
# Table name: responses
#
#  id          :integer         not null, primary key
#  description :text
#  user_id     :integer
#  request_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  price       :string(5)
#  torg        :boolean
#

class Response < ActiveRecord::Base
  attr_accessible :description, :price, :torg

  belongs_to :request
  belongs_to :user

  validates :description, :presence => true
  validates :user_id, :presence => true
  validates :request_id, :presence => true

  validates_numericality_of :price, :only_integer => true
  validates :price, :length => { :within => 1..9 }

  default_scope :order => 'responses.created_at DESC'
end
