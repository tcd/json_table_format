require "test_helper"

module UtilTests
  class GetLengthTest < TestCase

    # @return [Integer]
    def get_length(object)
      return JsonTableFormat::Util.get_length(object)
    end

    test("returns '-1' for hashes")     { assert_equal(-1, get_length({}))        }
    test("returns '-1' for arrays")     { assert_equal(-1, get_length([1, 2, 3])) }
    test("works on 'true'")             { assert_equal(4,  get_length(true))      }
    test("works on 'false'")            { assert_equal(5,  get_length(false))     }
    test("works on positive integers")  { assert_equal(3,  get_length(420))       }
    test("works on negative integers")  { assert_equal(4,  get_length(-420))      }
    test("works on positive decimals")  { assert_equal(6,  get_length(420.69))    }
    test("works on negative decimals")  { assert_equal(7,  get_length(-420.69))   }

  end
end
