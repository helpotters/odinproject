# calculator_spec.rb
require('calculator')

describe Calculator do
  before { @calculator = Calculator.new }
  describe '#add' do
    it 'returns the sum of two numbers' do
      expect(@calculator.add(2, 5)).to eql(7)
    end
  end

  describe '#subtract' do
    it 'returns the different of two numbers' do
      expect(@calculator.subtract(5, 2)).to eql(3)
    end
  end

  describe '#multiply' do
    it 'returns the product of two numbers' do
      expect(@calculator.multiply(2, 5)).to eql(10)
    end
  end
  describe '#divide' do
    it 'returns the division of two numbers' do
      expect(@calculator.divide(10, 2)).to_not eql(8)
    end
  end
end
