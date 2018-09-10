require "scroll"

RSpec.describe Scroll do
  it "should send a display message to a receiver" do
    receiver = spy("receiver")
    scroller = Scroll.new("abc")

    scroller.show_on(receiver)

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
end

