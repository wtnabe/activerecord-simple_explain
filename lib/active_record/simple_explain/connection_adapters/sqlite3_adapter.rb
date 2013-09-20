require File.expand_path(File.dirname(__FILE__) + '/adapter_interface')

module ActiveRecord
  class SimpleExplain
    module SQLite3Adapter
      include AdapterInterface

      #
      # [param] Array
      # [return] String
      #
      def format(result)
        Hirb::Helpers::AutoTable.render(pre_format(result))
      end

      #
      # [param] Array
      # [return] Hash
      #
      def pre_format(result)
        result.map {|e|
          Hash[*e.select {|k, v|
                 k.is_a? String
               }.flatten]
        }
      end

      #
      # [return] String
      #
      def statement
        'explain query plan'
      end
    end
  end
end
