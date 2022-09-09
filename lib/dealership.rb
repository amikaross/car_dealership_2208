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

  def average_price_of_car 
    number_format(total_value / inventory_count)
  end

  def number_format(number)
    groups_of_three = number.to_s.chars.reverse.each_slice(3)
    groups_of_three.map {|group| group.join}.join(',').reverse
  end

  def cars_sorted_by_price 
    inventory.sort_by { |car| car.total_cost }
  end

  def inventory_hash 
    @inventory.each_with_object(Hash.new) do |car, hash|
      hash.keys.include?(hash[car.make]) ? next : hash[car.make] = cars_by_make(car.make)
    end 
  end
end