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

  describe "#details" do 
    it "returns a hash that includes the dealership's total value and address" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.details).to eq({"total_value"=>156000, "address"=>"123 Main Street"})
    end
  end

  describe "#average_price_of_car" do 
    it "returns a string of the average price of the cars in the inventory" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.average_price_of_car).to eq "39,000"
    end
  end

  describe "#cars_sorted_by_price" do 
    it "returns an array of cars sorted by price (low to high)" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.cars_sorted_by_price).to eq [@car_3, @car_4, @car_2, @car_1]
    end
  end

  describe "#inventory_hash" do 
    it "returns a hash" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      
      expect(@dealership.inventory_hash).to be_a Hash
    end

    it "has keys corresponding to car makes" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)

      expect(@dealership.inventory_hash.keys.include?("Ford")).to eq true
      expect(@dealership.inventory_hash.keys.include?("Toyota")).to eq true
      expect(@dealership.inventory_hash.keys.include?("Chevrolet")).to eq true
      expect(@dealership.inventory_hash.keys.length).to eq 3
    end

    it "has car objects for values" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      values = @dealership.inventory_hash.values
      values.each do |value|
        expect(value).to be_a Car
      end
    end

    it "corresponds the correct cars with their makes" do 
      @dealership.add_car(@car_1)
      @dealership.add_car(@car_2)
      @dealership.add_car(@car_3)
      @dealership.add_car(@car_4)
      inventory_hash = @dealership.inventory_hash
      expect(inventory_hash["Ford"]).to eq @car_1
      expect(inventory_hash["Chevrolet"]).to eq @car_4
    end
  end
end