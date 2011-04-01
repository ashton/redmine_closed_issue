module IssueQueryPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :available_filters, :closed_date
    end
  end

  module InstanceMethods
    def available_filters_with_closed_date
      filters = available_filters_without_closed_date
      filters["closed_date"] = { :type => :date, :order => 7 }
    end
  end
end