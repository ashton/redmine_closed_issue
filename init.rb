require 'redmine'
require 'close_issue'

Redmine::Plugin.register :redmine_redmine_close_issue do
  name 'Redmine Close Issue plugin'
  author 'Matheus Ashton Silva'
  description 'A plugin that save the date when the issue is closed, and shows it on issue/show view'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
