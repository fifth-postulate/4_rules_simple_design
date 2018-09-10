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
      letter('C').should_convert_to([
         '.....',
         '.***.',
         '*...*',
         '*....',
         '*....',
         '*...*',
         '.***.',
       ]),
      letter('D').should_convert_to([
         '.....',
         '****.',
         '*...*',
         '*...*',
         '*...*',
         '*...*',
         '****.',
       ]),
      letter('E').should_convert_to([
         '.....',
         '*****',
         '*....',
         '****.',
         '*....',
         '*....',
         '*****',
       ]),
      letter('F').should_convert_to([
         '.....',
         '*****',
         '*....',
         '****.',
         '*....',
         '*....',
         '*....',
       ]),
      letter('G').should_convert_to([
         '.....',
         '*****',
         '*....',
         '*.**.',
         '**..*',
         '*...*',
         '****.',
       ]),
      letter('H').should_convert_to([
         '.....',
         '*...*',
         '*...*',
         '*****',
         '*...*',
         '*...*',
         '*...*',
       ]),
      letter('I').should_convert_to([
         '.....',
         '.***.',
         '..*..',
         '..*..',
         '..*..',
         '..*..',
         '.***.',
       ]),
      letter('J').should_convert_to([
         '.....',
         '.****',
         '...*.',
         '...*.',
         '...*.',
         '*..*.',
         '.**..',
       ]),
      letter('K').should_convert_to([
         '.....',
         '*...*',
         '*..*.',
         '***..',
         '*..*.',
         '*...*',
         '*...*',
       ]),
      letter('L').should_convert_to([
         '.....',
         '*....',
         '*....',
         '*....',
         '*....',
         '*....',
         '*****',
       ]),
      letter('M').should_convert_to([
         '.....',
         '*...*',
         '**.**',
         '*.*.*',
         '*...*',
         '*...*',
         '*...*',
       ]),
      letter('N').should_convert_to([
         '.....',
         '*...*',
         '**..*',
         '*.*.*',
         '*..**',
         '*..**',
         '*...*',
       ]),
      letter('O').should_convert_to([
         '.....',
         '.***.',
         '*...*',
         '*...*',
         '*...*',
         '*...*',
         '.***.',
       ]),
      letter('P').should_convert_to([
         '.....',
         '****.',
         '*...*',
         '****.',
         '*....',
         '*....',
         '*....',
       ]),
      letter('Q').should_convert_to([
         '.....',
         '.***.',
         '*...*',
         '*...*',
         '*.*.*',
         '*..**',
         '.****',
       ]),
      letter('R').should_convert_to([
         '.....',
         '****.',
         '*...*',
         '****.',
         '*...*',
         '*...*',
         '*...*',
       ]),
      letter('S').should_convert_to([
         '.....',
         '.***.',
         '*...*',
         '.**..',
         '...*.',
         '*...*',
         '.***.',
       ]),
      letter('T').should_convert_to([
         '.....',
         '*****',
         '..*..',
         '..*..',
         '..*..',
         '..*..',
         '..*..',
       ]),
      letter('U').should_convert_to([
         '.....',
         '*...*',
         '*...*',
         '*...*',
         '*...*',
         '*...*',
         '.****',
       ]),
      letter('V').should_convert_to([
         '.....',
         '*...*',
         '*...*',
         '*...*',
         '*...*',
         '.*.*.',
         '..*..',
        ]),
      letter('W').should_convert_to([
         '.....',
         '*...*',
         '*...*',
         '*...*',
         '*.*.*',
         '*.*.*',
         '.*.*.',
       ]),
      letter('X').should_convert_to([
         '.....',
         '*...*',
         '.*.*.',
         '..*..',
         '.*.*.',
         '*...*',
         '*...*',
       ]),
      letter('Y').should_convert_to([
         '.....',
         '*...*',
         '*...*',
         '.*.*.',
         '..*..',
         '..*..',
         '..*..',
       ]),
      letter('Z').should_convert_to([
         '.....',
         '****.',
         '...*.',
         '..*..',
         '.*...',
         '*....',
         '*****',
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
