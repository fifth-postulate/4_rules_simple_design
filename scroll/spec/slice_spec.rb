require "slice"

RSpec.describe "#slice" do
  before(:each) do
    @pattern = [
      '0123456789',
      '*.*.*.*.*.',
      '.*.*.*.*.*',
    ]
  end

  it "should slice a part of an array starting from index 0 with length 1" do
    a_slice = slice(1).of(@pattern).at(0)

    expect(a_slice).to eq ['0',
                           '*',
                           '.']
  end

  it "should slice a part of an array starting from index 0 with length 2" do
    a_slice = slice(2).of(@pattern).at(0)

    expect(a_slice).to eq ['01',
                           '*.',
                           '.*']
  end

  it "should slice a part of an array starting from index 1 with length 3" do
    a_slice = slice(3).of(@pattern).at(1)

    expect(a_slice).to eq ['123',
                           '.*.',
                           '*.*']
  end
end
