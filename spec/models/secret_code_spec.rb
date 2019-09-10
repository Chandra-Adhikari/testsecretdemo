require 'rails_helper'

RSpec.describe SecretCode, :type => :model do
  subject { SecretCode.last }

  describe 'model attributes fields' do
    it "is valid with valid attributes" do
      subject.code = "foobar"
      expect(subject).to be_valid
    end
	end

	describe 'Associations' do
    it "should has one user" do
    t = SecretCode.reflect_on_association(:user)
    expect(t.macro).to eq(:has_one)
  end
	end
end
