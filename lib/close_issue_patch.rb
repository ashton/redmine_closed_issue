module ClosedDateIssue
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context)
      save_closed_date(context)
    end

    def controller_issues_edit_before_save(context)
      save_closed_date(context)
    end

    def save_closed_date(context)
      if(context[:issue])
        closed_statuses = IssueStatus.find(:all, :conditions => { :is_closed => true })
        find = closed_statuses.find_all { |obj| obj.id == context[:issue].status.id}
        if(context[:issue].status.id ==  closed_statuses or (closed_statuses.instance_of? Array and find.size() > 0))
          context[:issue].closed_date = Time.now
        else
          context[:issue].closed_date = nil if(context[:issue].closed_date)
        end
      end
    end
  end
end