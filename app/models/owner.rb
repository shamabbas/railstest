# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Owner < ActiveRecord::Base
  has_many :articles

  # Validatons applied
  validates :name, presence: true, length: { maximum: 50 }

end
