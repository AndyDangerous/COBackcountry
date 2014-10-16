require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) do
    create(:user)
  end

  xit 'is valid' do
    expect(user).to be_valid
  end

  xit { should validate_presence_of(:name) }

  xit { should validate_presence_of(:email) }

end
