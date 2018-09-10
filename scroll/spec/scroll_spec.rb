require "scroll"

RSpec.describe Scroll do
  before(:each) do
    @scroller = Scroll.new("abc")
  end

  it "should send a display message to a receiver" do
    receiver = spy("receiver")

    @scroller.show_on(receiver)

    expect(receiver).to have_received(:show).with([
                                                    '........',
                                                    '........',
                                                    '..*...**',
                                                    '.*.*..*.',
                                                    '*...*.**',
                                                    '*****.*.',
                                                    '*...*.*.',
                                                    '*...*.**',
                                                   ])
  end

  it "should send a display message to a receiver after an advance" do
    receiver = spy("receiver")

    @scroller.advance
    @scroller.show_on(receiver)

    expect(receiver).to have_received(:show).with([
                                                    '........',
                                                    '........',
                                                    '.*...***',
                                                    '*.*..*..',
                                                    '...*.***',
                                                    '****.*..',
                                                    '...*.*..',
                                                    '...*.***',
                                                  ])
  end
end

