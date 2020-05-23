require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'association' do
    it { should belong_to(:attendee) }
    it { should belong_to(:attended_event) }
  end
end
