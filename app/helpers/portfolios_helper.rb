module PortfoliosHelper
  def form_action
    if @portfolio.id.present?
      "Update your portfolio"
    else
      "Create portfolio"
    end
  end
end
