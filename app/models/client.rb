class Client < ActiveRecord::Base
  attr_accessible :consultant, :indicator, :name, :cpf, :address, :neighborhood, :city, :stade, :zip
  validates_presence_of :name, :cpf, :address, :neighborhood, :city, :stade, :zip
  validates_uniqueness_of :name
  usar_como_cpf :cpf
end
