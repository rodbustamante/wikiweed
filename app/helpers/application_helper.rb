module ApplicationHelper
  def categories
    Category.order('name').all
  end
end