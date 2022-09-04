require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do 
    @dealership = Dealership.new('Acme Auto', '123 Main Street')
    @car_1 = Car.new('Ford Mustang', 1500, 36)
    @car_2 = Car.new('Toyota Prius', 1000, 48)
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@dealership).to be_a Dealership 
    end

    it 'has an empty inventory by default' do 
      expect(@dealership.inventory).to eq []
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
end