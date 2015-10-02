module ApplicationHelper
  def strains
    Strain.order('sort_order', 'name').all
  end
end