require "convert"

RSpec.describe Convert do
  it "returns a dot-matrix representation for a \"A\"" do
    convert = Convert.new

    expect(convert.letter 'a').to eq []
  end
end
