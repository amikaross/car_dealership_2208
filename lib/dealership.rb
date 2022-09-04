require './lib/car'

class Dealership
  attr_reader :inventory

  def initialize(name, address)
    @name = name 
    @address = address 
    @inventory = []
  end

  def inventory_count 
    @inventory.count
  end

  def add_car(car)
    @inventory.push(car) 
  end

  def has_inventory?
    @inventory != []
  end

  def cars_by_make(make)
    @inventory.select { |car| car.make == make }
  end
end