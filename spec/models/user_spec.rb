require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) do
    create(:user)
  end

  context 'signed in guests' do
    before do
      guest = create(:user,:guest)
      OmniAuth.config.mock_auth[:google] = {
            uid: guest.uid
        }
        session[:user_id] = guest.id
      end
      it "shows the Please Wait for Confirmation view" do
        puts "Rspec says Current User: #{@current_user.inspect}"
        get :index
        response.should render_template :pending_authorization
      end
    end
  end
  
  xit 'is valid' do
    expect(user).to be_valid
  end

  xit { should validate_presence_of(:name) }

  xit { should validate_presence_of(:email) }

end
