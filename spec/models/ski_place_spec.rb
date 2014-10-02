require 'rails_helper'

RSpec.describe SkiPlace, type: :model do

  let(:ski_place) do
    create(:ski_place)
  end

  it 'is valid' do
    expect(ski_place).to be_valid
  end
end
