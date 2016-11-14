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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
