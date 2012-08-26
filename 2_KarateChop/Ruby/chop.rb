### NOTES ###
# When recursing, needed some way to keep track of the 'middle start position'
#


require 'test/unit'
def chop_recursive1(search_target,array_to_search)
	puts "Searching #{array_to_search} for #{search_target}"
	if array_to_search.length == 0 then
		return -1
	elsif array_to_search.length == 1 then
		if array_to_search[0] == search_target
			return 0
		else
			return -1
		end
	elsif array_to_search.length == 2 then
		if search_target == array_to_search[0] then
			return 0;
		elsif search_target == array_to_search[1] then
			return 1;
		else
			return -1
		end
	else
		middle = array_to_search.length / 2
		if array_to_search[middle] == search_target then
			return middle
		elsif array_to_search[middle] > search_target
			return chop(search_target,array_to_search[0..middle])
		else
			result = chop(search_target,array_to_search[middle..-1])
			if result == -1 then
				return -1
			else
				return middle + result
			end
				
		end
	end

	0

end

def chop_iterative1(search_target, array_to_search)
	puts "Looking for #{search_target} in #{array_to_search}"
	return -1 if array_to_search.count == 0

	upper_bound = array_to_search.count - 1
	lower_bound = 0
	search_idx = upper_bound / 2

	found = false
	while not found
		
		puts "Checking first and last elements #{lower_bound}/#{upper_bound}"
		if array_to_search[lower_bound] == search_target
			puts "Found at first element"
			found = true
			search_idx = lower_bound
		elsif array_to_search[upper_bound] == search_target
			found = true
			search_idx = upper_bound
		else
			puts "Not found on edges of array, checking middle"

			if (upper_bound - lower_bound) <= 1
				found = true
				search_idx = -1
				break
			end
			puts "Comparing #{search_target} to #{array_to_search[search_idx]} at #{search_idx}"
			compare_result = search_target <=> array_to_search[search_idx]
			puts "Compare result #{compare_result}"

			if compare_result == 0
				found = true
			elsif compare_result == 1
				if lower_bound == search_idx
					puts "Lowerbound == search_idx"
					found = true
					search_idx = -1
				else
					puts "Setting lowerbound to #{search_idx}"
					lower_bound = search_idx
				end
			elsif compare_result == -1
				upper_bound = search_idx
			end

			if lower_bound >= upper_bound
				found = true
				search_idx = -1
			else
				puts "Computing new search index #{upper_bound} - #{lower_bound}"
				search_idx = search_idx + (((upper_bound - lower_bound) / 2) * compare_result)
			end

		end

	end

	puts "Search result is #{search_idx}"
	search_idx
end

def chop(search_target, array_to_search)
	chop_iterative1(search_target,array_to_search)
end

class KataTests < Test::Unit::TestCase
def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end

end