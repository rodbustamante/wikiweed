crumb :root do
  link "Home", root_path
end

# Categories List
crumb :categories do
  link "Categorías", categories_path
  parent :root
end

# Category Crumb
crumb :category do |category|
  link category.name.capitalize, category
  parent :categories
end

# Strain Crumb
crumb :strain do |strain|
  link strain.name.capitalize, strain
  parent :root
end

# Plant Crumb
crumb :plant do |plant|
  link plant.name.capitalize, plant
  parent plant.strain
end

# crumb :projects do
#   link "Projects", projects_path
# end

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