class GeocodeUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.geocode
  end
end
