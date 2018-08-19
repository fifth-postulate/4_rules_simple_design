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

[fizzbuzz]: https://codingdojo.org/kata/FizzBuzz/
[design]: https://leanpub.com/4rulesofsimpledesign
