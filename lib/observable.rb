module Observable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def wiretap _method, &callback
      alias_method "wiretapped_#{_method}", _method
      define_method _method do |*args, &block|
        begin
          send("wiretapped_#{_method}", *args, &block)
        rescue Exception => e
          exception = e; nil
        end.tap do |return_value|
          payload = {
            method: _method,
            args: args,
            block: block,
            return_value: return_value,
            exception: exception,
            receiver: self
          }
          callback.call(payload)
          raise exception if exception
        end
      end
    end
  end
end
