require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30)   }
    it { should validate_length_of(:email).is_at_least(3).is_at_most(30)   }
  end

  describe 'association' do
    it { should have_many(:events) }
    it { should have_many(:attended_events).through(:invitations) }
    it { should have_many(:invitations) }
  end

end