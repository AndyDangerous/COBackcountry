FactoryGirl.define do
  factory :ski_place do
    name "Elevator Shaft"
    description "The Elevator Shaft is a couloir on Hellet Peak in Rocky Mountain National Park."
    snotel_token ":berthoud_summit"
    avalanche_forecast_zone "front_range"
    # geometry
  end
end
