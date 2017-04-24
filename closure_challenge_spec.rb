describe 'The Closure Challenge' do

  def build_return_block_from a_block
    fail 'implement me'
  end

  def evaluate_and_return a_block
    return_block = build_return_block_from a_block
    
    return_block.call

    fail "this line shouldn't be executed"
  end

  def evaluate_with_args_and_return a_number, a_block
    return_block = build_return_block_from a_block
    
    return_block.call a_number

    fail "this line shouldn't be executed"
  end

  it 'returns from the calling method with the value returned from a proc' do
    result = evaluate_and_return proc{ 7 }

    result.should == 7
  end

  it 'returns from the calling method with the non-primitive value returned from a proc' do
    expected_result = Object.new

    result = evaluate_and_return proc{ expected_result }

    result.should == expected_result
  end

  it 'support arguments to be passed to the block' do
    result = evaluate_with_args_and_return 1, proc{ |number| number + 1 }

    result.should == 2
  end

end
