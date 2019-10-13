class Item < ApplicationRecord
  belongs_to :user

  def completed?
  	!completed_at.blank? # in ruby ! means not. So this means an item is completd if completed_at is not blank (i.e., not null)
  end

end 


