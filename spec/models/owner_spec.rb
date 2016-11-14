# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Owner, type: :model do

  describe '#list_of_all_owners' do
    it 'validate owners count' do
      4.times do |v|
        Owner.create name: "owner_#{v}"
      end
      # exercise to verify
      expect(Owner.count).to eq 5
    end
  end

  describe '#view_owner' do
    it 'returns the name of the owner' do
      # setup
      owner = build(:owner, name: 'Josh')

      # excercise and verify
      expect(owner.name).to eq 'Josh'
    end
  end
end
