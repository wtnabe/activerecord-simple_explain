module ActiveRecord
  class SimpleExplain
    module AdapterInterface
      class NotImplememted < StandardError; end

      def format(result)
        raise NotImplememted
      end

      def statement
        raise NotImplememted
      end
    end
  end
end
