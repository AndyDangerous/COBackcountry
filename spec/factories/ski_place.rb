FactoryGirl.define do
  factory :ski_place do
    name "Elevator Shaft"
    description "The Elevator Shaft is a couloir on Hellet Peak in Rocky Mountain National Park."
    snotel_station_id 1
    avalanche_forecast_zone_id 1
    geometry "POINT (-105.604107722 40.2477081249)"
  end
end
