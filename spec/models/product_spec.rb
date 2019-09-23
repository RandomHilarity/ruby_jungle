require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new
  end
  
  subject { described_class.new(name: "Test", price: 1, quantity: 1, category: @category) }

  describe 'Validations' do
      
    it "should validate when fully filled out" do
      expect(subject).to be_valid
    end
    it "should require a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Name can't be blank"
    end
    it "should require a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Price cents is not a number"
    end
    it "should require a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Quantity can't be blank"
    end
    it "should require a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Category can't be blank"
    end
  end
end
