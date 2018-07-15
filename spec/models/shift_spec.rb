RSpec.describe Shift, type: :model do
  subject { build :shift }
  it { is_expected.to belong_to(:restaurant) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:restaurant_id) }
  it { is_expected.to validate_presence_of(:restaurant_id) }
  it { is_expected.to validate_presence_of(:from) }
  it { is_expected.to validate_presence_of(:to) }

  it { is_expected.to allow_value('00:00').for(:from) }
  it { is_expected.to allow_value('00:00').for(:to) }
  it { is_expected.to allow_value('7:00').for(:from) }
  it { is_expected.to allow_value('7:00').for(:to) }
  it { is_expected.to allow_value('14:00').for(:from) }
  it { is_expected.to allow_value('14:00').for(:to) }
  it { is_expected.to allow_value('23:59').for(:from) }
  it { is_expected.to allow_value('23:59').for(:to) }

  it { is_expected.not_to allow_value('25:00').for(:from) }
  it { is_expected.not_to allow_value('25:00').for(:to) }
  it { is_expected.not_to allow_value('21:61').for(:from) }
  it { is_expected.not_to allow_value('21:61').for(:to) }

  describe 'validate time period' do
    subject { shift.valid? }
    let(:shift) { build :shift, from: from_time, to: to_time }
    context 'valid time' do
      context 'valid time 24h' do
        let(:from_time) { '9:00' }
        let(:to_time) { '19:00' }
        it { is_expected.to be_truthy }
      end
    end

    context 'invalid time' do
      context 'invalid time 24h' do
        let(:from_time) { '19:00' }
        let(:to_time) { '9:00' }
        it { is_expected.to be_falsey }
      end
    end
  end
end
