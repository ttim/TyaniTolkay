module ApplicationHelper
  def is_num?(str)
    if str == nil then
      return false
    end
    Integer(str)
  rescue ArgumentError
    false
  else
    true
  end
end

class Array
  # If +number+ is greater than the size of the array, the method
  # will simply return the array itself sorted randomly
  def randomly_pick(number)
    sort_by { rand }.slice(0...number)
  end
end