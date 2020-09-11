crumb :root do
  link "トップページ", root_path
end

crumb :new do
  link "出品", new_item_path
  parent :root
end

crumb :show do
  link "詳細", item_path
  parent :root
end

crumb :edit do
  link "編集", edit_item_path
  parent :show
end

crumb :search do
  link "検索", search_items_path
  parent :root
end

crumb :registrations do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :sessions do
  link "ログイン", user_session_path
  parent :root
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).