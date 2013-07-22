class Product < ActiveRecord::Base
  attr_accessible :name, :price, :warranty
  validates_presence_of :name, :price, :warranty
  validates_uniqueness_of :name
  belongs_to :user
end
