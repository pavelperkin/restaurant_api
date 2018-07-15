RSpec.describe Table, type: :model do
  subject { build :table }
  
  it { is_expected.to belong_to(:restaurant) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:restaurant_id) }
  it { is_expected.to validate_presence_of(:min_guests) }
  it { is_expected.to validate_numericality_of(:min_guests).only_integer.is_greater_than(0) }
  it { is_expected.to validate_presence_of(:max_guests) }
  it { is_expected.to validate_numericality_of(:max_guests).only_integer.is_greater_than(0) }
  it { is_expected.to validate_presence_of(:restaurant_id) }

  describe 'max_guests should be greater_than min_guests' do
    subject { table = build :table, min_guests: min_guests, max_guests: max_guests; table.valid? }

    context 'with valid min and max' do
      context 'min < max' do
        let(:min_guests) { 2 }
        let(:max_guests) { 6 }

        it { is_expected.to be_truthy }
      end

      context 'min == max' do
        let(:min_guests) { 4 }
        let(:max_guests) { 4 }

        it { is_expected.to be_truthy }
      end
    end

    context 'with invalid min and max' do
      context 'min > max' do
        let(:min_guests) { 4 }
        let(:max_guests) { 3 }

        it { is_expected.to be_falsey }
      end
    end
  end
end
