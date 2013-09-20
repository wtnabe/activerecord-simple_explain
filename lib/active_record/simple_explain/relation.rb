module ActiveRecord
  eager_autoload do
    autoload :Relation
  end

  class Relation
    alias_method :explain_org, :explain if method_defined? :explain

    def explain
      adapter = ActiveRecord::Base.connection.class.to_s.split(/::/).last

      exp = proc { SimpleExplain.new(adapter, to_sql).display }

      if method_defined? :explain_org
        if adapter == 'sqlite3'
          exp.call
        else
          explain_org
        end
      else
        exp.call
      end
    end
  end
end
