module OpticalElementsHelper

  def optical_element_user_name_exist(optical_element)
    optical_element.user.name != nil && optical_element.user.name != ""
  end

end
