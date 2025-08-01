module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_select
    sub_selection = []
    self.my_each do |elem|
      sub_selection << elem if yield(elem)
    end
    sub_selection
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |elem|
        count += 1 if yield(elem)
      end
    else
      self.my_each do |elem|
        count += 1
      end
    end
    count
  end

  def my_map
    mapped_arr = []
    if block_given?
      self.my_each do |elem|
        mapped_arr << yield(elem)
      end
    end
    mapped_arr
  end

  def my_inject(initial_val)
    final_value = initial_val
    self.my_each do |elem|
      final_value = yield(final_value, elem)
    end
    final_value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end
end
