# How to use method missing to create attr_accessors

# method_missing
# instance method
# attr_accessor when a method comes into method_missing


class DynamicClass
  # Use this to define accessors for "meth"
  # def flim_the_flam(meth)
  #   # self.class.attr_accessor(meth)
  #   # self.class.send(:attr_accessor, meth)  # => nil
    # self.class.class_eval do
    #   attr_accessor meth
    # end
  # end

  def method_missing(meth, *args)
    create_accessors_for(meth)
    # Send the message again
    self.public_send(meth, *args)
  end

  private
  def create_accessors_for(meth)
    the_method = meth.to_s.end_with?("=") ? meth.to_s.chop : meth.to_s
    self.class.class_eval do
      attr_accessor the_method
    end
  end
end

dc = DynamicClass.new
dc.zorp=("Zip zip zam")
dc.zorp
