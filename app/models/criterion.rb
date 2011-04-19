class Criterion < ActiveRecord::Base
  attr_accessible :name, :values_attributes

  belongs_to :request
  has_many :values
  
  accepts_nested_attributes_for :values, :allow_destroy => true
end
