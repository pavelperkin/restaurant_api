RSpec.describe Guest, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('admin@example.com').for(:email) }
  it { is_expected.not_to allow_value('').for(:email) }
  it { is_expected.not_to allow_value('Full Name').for(:email) }
  it { is_expected.not_to allow_value('invalid@email@for.user').for(:email) }
end
