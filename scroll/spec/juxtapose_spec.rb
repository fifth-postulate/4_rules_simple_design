require "juxtapose"

RSpec.describe Juxtapose do
  before(:each) do
    @juxtapose = Juxtapose.new
  end

  it "should juxtapose two arrays of empty strings" do
    result = @juxtapose.these([''], [''])

    expect(result).to eq ['']
  end

  it "should juxtapose two arrays of single character strings" do
    result = @juxtapose.these(['*'], ['.'])

    expect(result).to eq ['*.']
  end

  it "should juxtapose two arrays of multi-character strings" do
    result = @juxtapose.these(['*.*.'], [ '.*_*.' ])

    expect(result).to eq ['*.*..*_*.']
  end

  it "should juxtapose two arrays with multiple multi-character strings" do
    result = @juxtapose.these(['*.', '.*'], ['.*', '.*'])

    expect(result).to eq ['*..*', '.*.*']
  end

  it "should juxtapose multiple arrays with multiple multi-character strings" do
    result = @juxtapose.these(['*.', '.*'], ['.*', '.*'], ['*.', '*.'])

    expect(result).to eq ['*..**.', '.*.**.']
  end
end
