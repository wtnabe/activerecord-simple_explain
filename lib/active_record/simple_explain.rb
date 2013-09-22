require 'hirb-unicode'

module ActiveRecord
  class SimpleExplain
    #
    # [param] String adapter
    #
    def initialize(adapter, sql)
      #
      # {class => filename}
      #
      @adapters = {}
      init_adapters

      @sql      = sql
      load_adapter(adapter)
    end
    attr_reader :sql

    def init_adapters
      %w(SQLite3Adapter sqlite3_adapter
         PostgreSQLAdapter postgresql_adapter).each_cons(2) { |k, v|
        add_adapter(k, v)
      }
    end

    def add_adapter(klass, filename)
      @adapters[klass] = filename
    end

    def load_adapter(adapter)
      require "active_record/simple_explain/connection_adapters/#{filename(adapter)}"
      self.class_eval {
        include ActiveRecord::SimpleExplain.const_get(adapter)
      }
    end

    def filename(adapter)
      if @adapters.has_key? adapter
        @adapters[adapter]
      else
        adapter.underscore
      end
    end

    def display
      puts format(result)
    end

    #
    # [return] Object ( Adapter::Result or Array )
    #
    def result
      ActiveRecord::Base.connection.execute("#{statement} #{sql}")
    end
  end
end

Dir.glob(File.dirname(__FILE__) + '/simple_explain/*.rb').each {|f|
  require f.sub(/\.rb/, '')
}
