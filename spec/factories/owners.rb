# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :owner do
    name "James"
  end
end
