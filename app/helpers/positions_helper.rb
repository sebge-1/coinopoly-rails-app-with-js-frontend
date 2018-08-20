module PositionsHelper
  def position_form_action
    if @position.id.present?
      "Update your position"
    else
      "Add a balance to your portfolio"
    end
  end
end
