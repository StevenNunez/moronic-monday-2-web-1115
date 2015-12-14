class TestingSelf
  def what_is_self?
    self             # => #<TestingSelf:0x007f8f430acab0>, #<TestingSelf:0x007f8f430acab0>
  end
end

ts = TestingSelf.new    # => #<TestingSelf:0x007f8f430acab0>
ts.what_is_self?        # => #<TestingSelf:0x007f8f430acab0>
ts == ts.what_is_self?  # => true
self                    # => main
