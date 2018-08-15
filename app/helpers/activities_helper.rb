module ActivitiesHelper
  def displayable?(activity)
    activity.trackable_type == "Portfolio" && activity.trackable.public || activity.trackable_type == "Position" && activity.trackable.portfolio.public
  end
end
