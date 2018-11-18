def random_pair(names)
  arr = []
  pairing = names.shuffle.each_slice(2)
  pairing.each do |item|
    #puts "item: #{item}"
    if item.length == 2
      arr << item
    else
      if arr.empty?
        arr << item
      else
        arr[rand(arr.length)].concat(item)
      end 
    end
  end
  puts "array: #{arr}"
  return arr
end
