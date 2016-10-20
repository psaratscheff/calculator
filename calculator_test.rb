require_relative 'calculator'
require 'minitest/autorun'

describe 'Calculator test' do
  def setup
    @calculator = Calculator.new
  end

  # Test calculate_answer

  it 'should add correctly' do
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

  it 'should throw input error when not integers as input STRINGS' do
    a = 'words'
    b = 'characters%"/)'
    assert_raises TypeError do
      @calculator.calculate_answer('divide', a, b)
    end
  end

  it 'should throw input error when not integers as input BOOLEAN' do
    a = false
    b = 234
    assert_raises NoMethodError do
      @calculator.calculate_answer('divide', a, b)
    end
  end

  it 'should throw NoMethodError when unavailable operation' do
    a = false
    b = 234
    assert_raises NoMethodError do
      @calculator.calculate_answer('some_non_existant_operation', a, b)
    end
  end

  # test request_calculation_type

  it 'should return add' do
    assert @calculator.request_calculation_type(1) == 'add'
  end

  it 'should return subtract' do
    assert @calculator.request_calculation_type(2) == 'subtract'
  end

  it 'should return multiply' do
    assert @calculator.request_calculation_type(3) == 'multiply'
  end

  it 'should return divide' do
    assert @calculator.request_calculation_type(4) == 'divide'
  end

  it 'should throw NoMethodError as it does not exist' do
    assert_raises NoMethodError do
      assert @calculator.request_calculation_type(9999)
    end
  end
end
