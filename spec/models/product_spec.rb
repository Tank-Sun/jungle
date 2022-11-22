require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be saved' do
      @category = Category.new
      @product = Product.new(name: "basketball", price: 12800, quantity: 58, category: @category )
      @product.save
      expect(@product).to be_valid
    end
    it 'should show error when name is not given' do
      @category = Category.new 
      @product = Product.new(price: 12800, quantity: 58, category: @category )
      @product.save
      expect(@product.errors.messages[:name]).to include('can\'t be blank')
    end
    it 'should show error when price is not given' do
      @category = Category.new
      @product = Product.new(name: "basketball", quantity: 58, category: @category )
      @product.save
      expect(@product.errors.messages[:price]).to include('can\'t be blank')
    end
    it 'should show error when quantity is not given' do
      @category = Category.new
      @product = Product.new(name: "basketball", price: 12800, category: @category )
      @product.save
      expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
    end
    it 'should show error when category is not given' do
      @category = Category.new 
      @product = Product.new(name: "basketball", price: 12800, quantity: 58)
      @product.save
      expect(@product.errors.messages[:category]).to include('can\'t be blank')
    end
  end
end
