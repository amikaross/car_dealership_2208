require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do 
    @dealership = Dealership.new('Acme Auto', '123 Main Street')
    @car_1 = Car.new('Ford Mustang', 1500, 36)
    @car_2 = Car.new('Toyota Prius', 1000, 48)
    @car_3 = Car.new('Toyota Tercel', 500, 48)
    @car_4 = Car.new('Chevrolet Bronco', 1250, 24)
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@dealership).to be_a Dealership 
    end

    it 'has an empty inventory by default' do 
      expect(@dealership.inventory).to eq []
    end

    it 'has a readable "details" attribute' do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.details).to eq({"total_value"=>156000, "address"=>"123 Main Street"})
    end
  end

  describe '#inventory_count' do 
    it 'counts the number of cars in the inventory' do 
      expect(@dealership.inventory_count).to eq 0
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      
      expect(@dealership.inventory_count).to eq 2
    end
  end

  describe '#add_car' do 
    it 'adds car objects to the inventory' do
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)

      expect(@dealership.inventory).to eq [@car_1, @car_2]
    end
  end

  describe '#has_inventory?' do 
    it 'returns true/false depending on whether or not inventory is empty' do 
      expect(@dealership.has_inventory?).to eq false 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.has_inventory?).to eq true 
    end
  end

  describe '#cars_by_make' do 
    it 'returns an array that includes cars which match the given make' do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.cars_by_make('Toyota')).to eq [@car_2, @car_3]
      expect(@dealership.cars_by_make('Ford')).to eq [@car_1]
    end
  end

  describe '#total_value' do 
    it 'returns the total value of all the cars in the inventory' do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.total_value).to eq 156000
    end
  end
end