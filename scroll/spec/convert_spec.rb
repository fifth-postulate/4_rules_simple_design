require "convert"

RSpec.describe Convert do
  it "returns a dot-matrix representation for a \"A\"" do
    convert = Convert.new

    expect(convert.letter 'A').to eq [
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
    convert = Convert.new

    expect(convert.letter 'B').to eq [
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
