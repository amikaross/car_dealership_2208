require './lib/car'

class Dealership
  attr_reader :inventory,
              :details

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

  def total_value
    total_value = 0
    @inventory.each do |car|
      total_value += car.total_cost
    end
    total_value
  end

  def details 
    {
      "total_value" => total_value,
      "address" => @address
    }
  end
end