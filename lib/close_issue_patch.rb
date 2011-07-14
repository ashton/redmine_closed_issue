module ClosedDateIssue
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context)
      if context[:issue] and context[:issue].status.is_closed? then
        context[:issue].closed_date = Time.now
      end
    end

    def controller_issues_edit_before_save(context)
      if context[:issue] then
        @issue = Issue.find context[:issue].id
        unless @issue.status.id == context[:issue].status.id then # CHANGED STATUS
          if context[:issue].status.is_closed?
            context[:issue].closed_date = Time.now
          else
            context[:issue].closed_date = nil if(context[:issue].closed_date)
          end
        end
      end
    end
    alias_method :controller_issues_bulk_edit_before_save, :controller_issues_edit_before_save
  end
end
