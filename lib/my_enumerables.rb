# enumerable
module Enumerable
  # Your code goes here
  def my_each_with_index
    return unless block_given?

    index = 0
    for elem in self
      yield elem, index
      index += 1
    end
  end

  def my_select
    return unless block_given?

    results = []
    my_each { |elem| results.push(elem) if yield elem}
    results
  end

  def my_all?
    return unless block_given?

    my_each { |elem| return false unless yield elem }
    true
  end

  def my_any?
    return unless block_given?

    my_each { |elem| return true if yield elem }
    false
  end

  def my_none?
    return unless block_given?

    my_each { |elem| return false if yield elem }
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |elem| count += 1 if yield elem }
      count
    else
      count = length
    end
  end

  def my_map
    return unless block_given?

    new_arr = []
    my_each { |elem| new_arr.push(yield elem)}
    new_arr
  end

  def my_inject(initial=nil)
    accum = initial || first

    my_each { |elem| accum = yield(accum, elem)}
    accum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?

    for elem in self do
      yield elem
    end
  end
end
