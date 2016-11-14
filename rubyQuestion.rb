# Copy of map function
class Array
  def my_map(&block)
    output = []
    each { |element| output << block.call(element) }
    output
  end
end

# Set array values in variable arr
arr = [1,2,3,4]

# Print out values
p arr.my_map(&:to_s)
