module ApplicationHelper
  def categories
    Category.order('sort_order', 'name').all
  end
end