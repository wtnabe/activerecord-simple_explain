require 'active_record/simple_explain/connection_adapters/adapter_interface'

module ActiveRecord
  class SimpleExplain
    module PostgreSQLAdapter
      include AdapterInterface

      #
      # [param]  Object
      # [return] String
      #
      def format(result)
        result.values.join("\n")
      end

      #
      # [return] String
      #
      def statement
        'explain'
      end
    end
  end
end
