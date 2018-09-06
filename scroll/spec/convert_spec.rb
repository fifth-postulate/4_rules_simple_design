require "convert"

RSpec.describe Convert do
  before(:each) do
    @convert = Convert.new
  end

  it "returns a dot-matrix representation for capital letters" do
    [
      letter('A').should_convert_to([
         '.....',
         '..*..',
         '.*.*.',
         '*...*',
         '*****',
         '*...*',
         '*...*',
      ]),
      letter('B').should_convert_to([
         '.....',
         '****.',
         '*...*',
         '****.',
         '*...*',
         '*...*',
         '****.',
       ]),
    ].each do |test_case|
      representation = @convert.letter test_case.a_letter

      expect(representation).to eq test_case.expected_representation
    end
  end
end

def letter(a_letter)
  CaseBuilder.new(a_letter)
end

class CaseBuilder
  def initialize(letter)
    @letter = letter
  end

  def should_convert_to(representation)
    Case.new(@letter, representation)
  end
end

class Case
  def initialize(letter, representation)
    @letter = letter
    @representation = representation
  end

  def a_letter
    @letter
  end

  def expected_representation
    @representation
  end
end
