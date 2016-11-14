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

class Article < ActiveRecord::Base
  belongs_to :owner

  # Validatons applied
  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :owner_id, presence: true, allow_nil: false
end
