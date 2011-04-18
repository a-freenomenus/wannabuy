class Criterion < ActiveRecord::Base
  attr_accessible :name

  belongs_to :request
  has_many :values
end
