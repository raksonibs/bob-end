require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'outputs correct email' do 
    expect(user.output_email).to be(user.email)
  end
end
