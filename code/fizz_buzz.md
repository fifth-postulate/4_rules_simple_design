# FizzBuzz
This is an annotated walk through of the [`FizzBuzz` kata][fizzbuzz]. The goal
is to demonstrate the [_4 rules of simple design_][design].

1. Tests Pass
2. Expresses Intent
3. No duplication
4. Small

## Requirements
Create a function that accepts a number `n` and returns

1. `"Fizz"` if `n` is divisible by 3.
2. `"Buzz"` if `n` is divisible by 5.
3. `"FizzBuzz"` if `n` divisible by both 3 and 5.
4. Otherwise, a string representations of `n`.

## Kata
### `fizzbuzz.of(1)`
We start out with a blank file. The first rule, **Tests pass**, Tells us that
tests are important. We better start out with them

```ruby
require "test/unit"

class FizzBuzzTest < Test::Unit::TestCase
end
```

This introduces the necessary modules into scope and enough of a scaffold to
start writing tests. The second rule, **Express Intent** guides us to a
descriptive test name.

```ruby
def test_fizzbuzz_of_1_should_equal_1
end
```

When reading the method name, we get a clear understanding what we try to
achieve. Let's express that in code.

```ruby
assert_equal("1", fizzbuzz.of(1))
```

This fails miserably when running the tests. The error message: 

```plain
undefined local variable or method 'fizzbuzz'
```

Provides a useful hint.

```ruby
fizzbuzz = FizzBuzz.new
```

Running the tests we notice that this fails as well, but for a different reason.
This time `FizzBuzz` is not known.

```ruby
class FizzBuzz
end
```
It might get a bit tedious, but this fails as well. The method `of` is
undefined.

```ruby
def of(n)
end
```

For the final time, the test fails. This time because we return `nil` from our
method. Let's fix that and bask in the glory of a successful test.

```ruby
def of(n)
  "1"
end
```

### `fizzbuzz.of(2)`
The next step is the `fizzbuzz` of 2. We quickly make a copy of a test, stopping
only to make a note that we _copied_ something.

```ruby
def test_fizzbuzz_of_2_should_equal_2
	fizzbuzz = FizzBuzz.new
	assert_equal("2", fizzbuzz.of(2))
end
```

This fails, because our return value is hard coded. Let's change the
implementation.

```ruby
def of(n)
	n.to_s
end
```

Although the test pass, there is a lot of duplication, which we should address
according to rule 3, **no duplication**.

The first thing that is duplicated is the knowledge of how a `FizzBuzz` is
created in the tests. This can be remedied by creating a `setup` method and
defining a `fizzbuzz` field, and use it.

```ruby
def setup
	@fizzbuzz = FizzBuzz.new
end
```

There is some other duplication, but we will wait until we have an better
opportunity to address it.

### `fizzbuzz.of(3)`
The next stop is the `fizzbuzz` of 3. Another quick copy of the test, checks
that case.

```ruby
def test_fizzbuzz_of_3_should_equal_Fizz
	assert_equal("Fizz", @fizzbuzz.of(3))
end
```

This fails as expected. The quickest way to a passing set of tests is to add a
guard to our implementation.

```ruby
def of(n)
	if n == 3 then
		return "Fizz"
	end
	n.to_s
end
```

With the tests passing, let's step back to our note. We copied a test
twice. This duplicates the knowledge of how to test `fizzbuzz` and is in
violation with **rule 3**. We are going to address that now.

```ruby
def test_fizzbuzz
	[
		[1, "1"],
		[2, "2"],
		[3, "Fizz"]
	].each {|test_case|
		assert_equal(test_case[1], @fizzbuzz.of(test_case[0]))
	}
end
```

This code separates how to test and what to test. By introducing it we
prevent the duplication of how to test `fizzbuzz`. After a quick check that our
new test works correctly, we can safely delete the original tests. These only
duplicate both the knowledge of what to test and the knowledge how to test is.

We do make a note that our test cause does not express intent very
clearly.

### `fizzbuzz.of(5)`
The next interesting case is 5. Adding a test for is is nothing more than adding
an other test case.

```ruby
[5, "Buzz"]
```

Again, this fails as expected. We have some experience with this kind of
failure. Let's add to our implementation, by copying our guard.

```ruby
if n == 5 then
	return "Buzz"
end
```

The tests pass, but we copied some code. Let's make a note of that. We
also have a note about the expression of intent in our test code. We will
address that first.

We have spoken about test case, so let's conjure them up.

```ruby
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
```

This allows us to name the arguments for the `test_case` instead of getting them
by index. Out test now looks like

```ruby
def test_fizzbuzz
	[
		Case.new(1, "1"),
		Case.new(2, "2"),
		Case.new(3, "Fizz"),
		Case.new(5, "Buzz")
	].each {|test_case|
		assert_equal(test_case.message, @fizzbuzz.of(test_case.n))
	}
end
```

This is an improvement. There are still improvements to be made, but let us not
forget why we are here.

### `fizzbuzz.of(6)`
In our implementation we test for a literal 3. The next interesting test case is
that of 6.

```ruby
Case.new(6, "Fizz")
```

As to be expected this fails. Changing the guard for 3 solves that problem.

```ruby
def of(n)
	if n == 5 then
		return "Buzz"
	end
	if n % 3 == 0 then
		return "Fizz"
	end
	n.to_s
end
```

There is some apparent duplication, but we will make of note of that and work on
it until the case of 10.

### `fizzbuzz.of(10)`
We learned a lot in case 6, so now we tackle case 10. We want to focus on the
duplication. First add a new test case.

```ruby
Case.new(10, "Buzz")
```

This fails, but a similar solution can be made as for the case of 6.

```ruby
def of(n)
	if n % 5 == 0 then
		return "Buzz"
	end
	if n % 3 == 0 then
		return "Fizz"
	end
	n.to_s
end
```

The duplication we notice is the knowledge how we handle our guard. Let us
address that problem.

```ruby
class Case
	def initialize(divisor, response)
		@divisor = divisor
		@message = response
	end

	def applies_to(n)
		n % @divisor == 0
	end

	def response
		@response
	end
end
```

We introduce a `fizzbuzz` case. It is responsible to check if this case applies
to `n` and, if so, return a response. We can use it in the following way.

```ruby
		a_case = [
			Case.new(5, "Buzz"),
			Case.new(3, "Fizz")
		].find {|a_case| a_case.applies_to(n) }
		if a_case then
			return a_case.response
		else
			return n.to_s
		end
```

The will still pass all the tests. So we can remove the older implementation.
The result is a bit of an eye sore. It clearly violates rule 4 **small**. Let's
do the final case first.

### `fizzbuzz.of(15)`
The next and final step should be easy. We add a test case.

```ruby
Case.new(15, "FizzBuzz")
```

Notice the failing test. Implement it by adding a fizzbuzz case.

```ruby
Case.new(15, "FizzBuzz")
```

And all is well. We did notice that the implementation of our method isn't
small, violating **rule 4**.

The problem is that we need to distinguish between two cases, when we do find a
case that applies and when we don't find a case. If there would be a default
case, that would eliminate that check.

```ruby
class DefaultCase
	def applies_to(n)
		true
	end

	def response(n)
		n.to_s
	end
end
```

For our plan to work we need an argument to the response method of our general
case. Now that we have a `DefaultCase` we can add it to the cases as catch all.

```ruby
DefaultCase.new
```

Now that we know that we always have a case, we can remove the check.

```ruby
.response n
```

### Cleanup
Let's check our rules one more time.

#### rule 1; Tests pass
All the tests pass. This provides a strong sense of security when refactoring

#### rule 2; Express intent
##### What does the test case test?
When we look at our test method, there is some intent missing. What is a case
testing? Let's clean this up. We will introduce a test case builder.

```ruby
class CaseBuilder
	def initialize(n)
		@n = n
	end

	def should_equal(response)
		Case.new(@n, response)
	end
end
```

This class is designed to provide a fluent interface. Together with a factory
method

```ruby
def fizzbuzz_of(n)
	CaseBuilder.new(n)
end
```

we can express our test cases as

```ruby
fizzbuzz_of(1).should_equal("1"),
fizzbuzz_of(2).should_equal("2"),
fizzbuzz_of(3).should_equal("Fizz"),
fizzbuzz_of(5).should_equal("Buzz"),
fizzbuzz_of(6).should_equal("Fizz"),
fizzbuzz_of(10).should_equal("Buzz"),
fizzbuzz_of(15).should_equal("FizzBuzz")
```

##### How do we assert?
Our assertion is a bit convoluted, by introducing an assert method we express
our intent. Our test case asserts it self.

```ruby
def assert(framework, fizzbuzz)
	framework.assert_equal(self.message, fizzbuzz.of(self.n))
end
```

The body of our test loop can now be

```ruby
test_case.assert(self, @fizzbuzz)
```

#### Rule 3; Duplication
We have introduced two cases, the `FizzBuzz` case and the `FizzBuzzTest` case.
They are very similar. But the serve different purposes. So although the look
similar, they are not the same. Let's leave them apart for now.

#### Rule 4; Small
The `of` method is kind of big. Let's tuck the cases in a field an be done with
it

```ruby
def initialize 
	@cases = [
		Case.new(15, "FizzBuzz"),
		Case.new(5, "Buzz"),
		Case.new(3, "Fizz"),
		DefaultCase.new
	]
end
```

our `of` method becomes

```ruby
def of(n)
	@cases
		.find {|a_case| a_case.applies_to(n) }
		.response n
end
```

[fizzbuzz]: https://codingdojo.org/kata/FizzBuzz/
[design]: https://leanpub.com/4rulesofsimpledesign
