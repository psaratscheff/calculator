require_relative 'drink_ordering'
require_relative 'drink_errors'
require 'minitest/autorun'

describe 'Drink test' do
  def setup
  end

  it 'should not create drink with empty name' do
    assert_raises ValueError do
      Drink.new('', 4.95, -5, 'Good coffee.')
    end
  end

  it 'should not create drink with negative time' do
    assert_raises ValueError do
      Drink.new('Coffee', -5, 4.95, 'Good coffee.')
    end
  end

  it 'should not create drink with negative creation time' do
    assert_raises ValueError do
      Drink.new('Coffee', 4.95, -5, 'Good coffee.')
    end
  end

  it 'should not create drink with empty description' do
    assert_raises ValueError do
      Drink.new('Coffee', 4.95, -5, '')
    end
  end
end
