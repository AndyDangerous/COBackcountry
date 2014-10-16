FactoryGirl.define do
  factory :avalanche_forecast_zone do
    name "Front Range Zone"
    zone_url "https://avalanche.state.co.us/pub_bc_avo.php?zone=..."
    url "http://avalanche.state.co.us/forecasts/backcountry..."
    id 2
  end
end
