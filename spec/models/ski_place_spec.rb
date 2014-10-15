require 'rails_helper'

RSpec.describe SkiPlace, type: :model do

  let(:ski_place) do
    create(:ski_place)
  end

  it 'is valid' do
    expect(ski_place).to be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:name) }

  context "loading" do
    xit "can find its centroid" do
    end

    xit "can find its avy zone id" do
    end

    xit "can find its snotel station id" do
    end
  end
end
