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

	def fizzbuzz_of(n)
		CaseBuilder.new(n)
	end

	class CaseBuilder
		def initialize(n)
			@n = n
		end

		def should_equal(message)
			Case.new(@n, message)
		end
	end

	class Case
		def initialize(n, message)
			@n = n
			@message = message
		end

		def n
			@n
		end

		def message
			@message
		end
	end

	def setup
		@fizzbuzz = FizzBuzz.new()
	end

	def test_fizzbuzz_of_n_should_equal_message
		[
			fizzbuzz_of(1).should_equal("1"),
			fizzbuzz_of(2).should_equal("2"),
			fizzbuzz_of(3).should_equal("Fizz"),
			fizzbuzz_of(5).should_equal("Buzz"),
			fizzbuzz_of(6).should_equal("Fizz"),
			fizzbuzz_of(10).should_equal("Buzz"),
			fizzbuzz_of(15).should_equal("FizzBuzz")
		].each {|test_case| 
			assert_equal(test_case.message, @fizzbuzz.of(test_case.n))
		}
	end
end