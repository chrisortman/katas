### NOTES ###
# When recursing, needed some way to keep track of the 'middle start position'
#


require 'test/unit'
def chop(search_target,array_to_search)
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