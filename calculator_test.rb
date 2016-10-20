require_relative 'calculator'
require 'minitest/autorun'

describe 'Calculator test' do
  def setup
    @calculator = Calculator.new
  end

  # Test calculate_answer

  it 'should sum correctly' do
    a = Random.rand(-100..100)
    b = Random.rand(-100..100)
    assert @calculator.calculate_answer('add', a, b) == a + b
  end

  it 'should subtract correctly' do
    a = Random.rand(-100..100)
    b = Random.rand(-100..100)
    assert @calculator.calculate_answer('subtract', a, b) == a - b
  end

  it 'should multiply correctly' do
    a = Random.rand(-100..100)
    b = Random.rand(-100..100)
    assert @calculator.calculate_answer('multiply', a, b) == a * b
  end

  it 'should divide correctly' do
    a = Random.rand(-100..100)
    b = Random.rand(1..100)
    assert @calculator.calculate_answer('divide', a, b) == a / b
    assert @calculator.calculate_answer('divide', a, -b) == a / -b
  end

  it 'should show error on diving by 0' do
    a = Random.rand(-100..100)
    b = 0
    assert_raises ZeroDivisionError do
      @calculator.calculate_answer('divide', a, b)
    end
  end

  it 'should throw input error when not integers as input' do
    a = false
    b = 'characters%"/)'
    assert_raises ZeroDivisionError do
      @calculator.calculate_answer('divide', a, b)
    end
  end

  # Test request_calculation_type


end
