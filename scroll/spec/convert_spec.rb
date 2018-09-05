require "convert"

RSpec.describe Convert do
  before(:each) do
    @convert = Convert.new
  end

  it "returns a dot-matrix representation for capital letters" do
    [
      ['A', [
         '.....',
         '..*..',
         '.*.*.',
         '*...*',
         '*****',
         '*...*',
         '*...*',
       ]
      ],
      ['B', [
         '.....',
         '****.',
         '*...*',
         '****.',
         '*...*',
         '*...*',
         '****.',
       ]
      ],

    ].each do |test_case|
      expect(@convert.letter test_case[0]).to eq test_case[1]
    end
  end
end
