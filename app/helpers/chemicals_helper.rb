module ChemicalsHelper

  def chemical_user_name_exist(chemical)
    chemical.user.name != nil && chemical.user.name != ""
  end
  
end
