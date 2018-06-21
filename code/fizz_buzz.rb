require "test/unit"

class FizzBuzz

	class Case
		def initialize(divisor, message)
			@divisor = divisor
			@message = message
		end

		def applies_to(n)
			n % @divisor == 0 
		end

		def response(n)
			@message
		end
	end

	class DefaultCase
		def applies_to(n)
			true
		end

		def response(n)
			n.to_s
		end
	end

	def initialize()
		@cases = [
			Case.new(15, "FizzBuzz"),
			Case.new(5, "Buzz"),
			Case.new(3, "Fizz"),
			DefaultCase.new()
		]
	end

	def of(n)
		@cases
			.find {|a_case| a_case.applies_to(n)}
			.response n
	end
end

class FizzBuzzerTest < Test::Unit::TestCase

	def setup
		@fizzbuzz = FizzBuzz.new()
	end

	def test_fizzbuzz_of_1_is_1
		assert_equal("1", @fizzbuzz.of(1))
	end

	def test_fizzbuzz_of_2_is_2
		assert_equal("2", @fizzbuzz.of(2))
	end

	def test_fizzbuzz_of_3_is_Fizz
		assert_equal("Fizz", @fizzbuzz.of(3))
	end

	def test_fizzbuzz_of_5_is_Buzz
		assert_equal("Buzz", @fizzbuzz.of(5))
	end

	def test_fizzbuzz_of_6_is_Fizz
		assert_equal("Fizz", @fizzbuzz.of(6))
	end

	def test_fizzbuzz_of_10_is_Buzz
		assert_equal("Buzz", @fizzbuzz.of(10))
	end
	
	def test_fizzbuzz_of_15_is_FizzBuzz
		assert_equal("FizzBuzz", @fizzbuzz.of(15))
	end

end