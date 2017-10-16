require 'rails_helper'

describe Review do
  it { should belong_to(:business) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }
  it do
    should validate_numericality_of(:rating)
      .is_greater_than_or_equal_to(0)
      .is_less_than_or_equal_to(5)
      .only_integer
  end

  describe '#update_business_rating' do
    let(:business) { Fabricate(:business) }
    let(:review) { Fabricate.build(:review, business: business) }

    it 'calls update_business_rating when review is saved' do
      expect(review).to receive(:update_business_rating)
      review.save
    end
  end

  describe '#preview' do
    let(:short_review) { Fabricate(:review, body: "Good Place!") }
    let(:long_review) { Fabricate(:review, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis mauris ut tellus faucibus finibus. Nam fermentum enim ac dui tincidunt, vel laoreet augue lobortis. Praesent sit amet malesuada nunc integer et risus dictum quam.") }
    let(:long_review_preview) { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis mauris ut tellus faucibus finibus. Nam fermentum enim ac dui tincidunt, vel laoreet augue lobortis. Praesent sit amet malesuada nunc..." }

    it 'returns the whole body of the reivew if it is less than 30 words' do
      expect(short_review.preview).to eq(short_review.body)
    end

    it 'returns the first 30 words of the body of the review followed by an ellipsis' do
      expect(long_review.preview).to eq(long_review_preview)
    end
  end
end