require 'rails_helper'

describe Review do
  it { should belong_to(:business) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:user) }

  describe '#preview' do
    it 'returns the whole body of the reivew if it is less than 30 words' do
      review = Fabricate(:review, body: "Good Place!")
      expect(review.preview).to eq(review.body)
    end

    it 'returns the first 30 words of the body of the review followed by an ellipsis' do
      review = Fabricate(:review, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis mauris ut tellus faucibus finibus. Nam fermentum enim ac dui tincidunt, vel laoreet augue lobortis. Praesent sit amet malesuada nunc integer et risus dictum quam.")

      expect(review.preview).to eq("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mattis mauris ut tellus faucibus finibus. Nam fermentum enim ac dui tincidunt, vel laoreet augue lobortis. Praesent sit amet malesuada nunc...")
    end
  end
end