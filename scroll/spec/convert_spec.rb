require "convert"

RSpec.describe Convert do
  before(:each) do
    @convert = Convert.new
  end

  it "returns a dot-matrix representation for a \"A\"" do
    expect(@convert.letter 'A').to eq [
                                    '.....',
                                    '..*..',
                                    '.*.*.',
                                    '*...*',
                                    '*****',
                                    '*...*',
                                    '*...*',
                                  ]
  end

  it "returns a dot-matrix representation for a \"B\"" do
    expect(@convert.letter 'B').to eq [
                                    '.....',
                                    '****.',
                                    '*...*',
                                    '****.',
                                    '*...*',
                                    '*...*',
                                    '****.',
                                  ]
  end
end
