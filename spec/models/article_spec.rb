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

require 'rails_helper'

describe Article, type: :model do
  it { should belong_to(:owner) }
  it { should validate_presence_of(:name) }
  before :all do
    @owner = create(:owner)
  end

  describe '#list_of_all_articles' do
    it 'validate articles count per owner' do
      4.times do |v|
        @owner.articles.create name: "article_#{v}", price: '1.24', owner_id: @owner.id
      end
      expect(@owner.articles.count).to eq 4
    end
  end

  describe '#view_article' do
    it 'returns the name of the article of owner created above' do
      # setup
      article = build(:article, name: 'New Article', price: 1.23, description: "Abc test", owner_id: @owner.id)

      # excercise and verify
      expect(article.owner_id).to eq @owner.id
      expect(article.name).to eq "New Article"
    end
  end
  describe '#delete_article' do
    let(:article) { create(:article, name: 'US Elections', price: '100.00', owner_id: @owner.id) }
    it 'destroy monster' do
      article.delete
      expect(Article.count).to eq 0
    end
  end

end
