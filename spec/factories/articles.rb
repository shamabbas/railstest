# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  name        :string(100)
#  description :text
#  price       :decimal(10, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :article do
    name "US Elections"
    description "MyText"
    price "9.99"
    owner_id 1
  end
end

