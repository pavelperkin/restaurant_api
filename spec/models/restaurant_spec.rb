RSpec.describe Restaurant, type: :model do
  it { is_expected.to have_many(:shifts) }
  
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to allow_value('admin@example.com').for(:email) }
  it { is_expected.not_to allow_value('').for(:email) }
  it { is_expected.not_to allow_value('Full Name').for(:email) }
  it { is_expected.not_to allow_value('invalid@email@for.user').for(:email) }

  it { is_expected.to allow_value('333-333-3333').for(:phone) }
  it { is_expected.to allow_value('1-333-333-3333').for(:phone) }
  it { is_expected.not_to allow_value('').for(:phone) }
  it { is_expected.not_to allow_value('Some random string').for(:phone) }
  it { is_expected.not_to allow_value('314159265359').for(:phone) }
end
