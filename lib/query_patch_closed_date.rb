module IssueQueryPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :available_filters, :closed_date

      class << self
        alias_method_chain :available_columns, :closed_date
      end
    end
  end

  module InstanceMethods
    def available_filters_with_closed_date
      filters = available_filters_without_closed_date
      filters["closed_date"] = { :type => :date, :order => 7 } unless filters.include? "closed_date"
    end
  end

  module ClassMethods
    def available_columns_with_closed_date
      columns = available_columns_without_closed_date
      has_date_closed = columns.find_all { |coluna| coluna.name == :closed_date }
      columns << QueryColumn.new(:closed_date, :sortable => "#{Issue.table_name}.closed_date", :groupable => true, :caption => :field_closed_date) unless has_date_closed.size() > 0
      columns
    end
  end
end