require 'active_record/simple_explain/connection_adapters/adapter_interface'

module ActiveRecord
  class SimpleExplain
    module MysqlAdapter
      include AdapterInterface

      #
      # [param]  Object
      # [return] String
      #
      def format(result)
        Hirb::Helpers::AutoTable.render(pre_format(result))
      end

      #
      # [param]  Object
      # [return] Array
      #
      def pre_format(result)
        result.to_a.map {|r|
          Hash[*result.fields.zip(r).flatten]
        }
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

