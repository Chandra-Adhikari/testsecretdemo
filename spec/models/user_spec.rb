require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { User.last }

  describe 'model attributes fields' do
    it "is valid with valid attributes" do
      subject.email = "abc@test.com"
      expect(subject).to be_valid
    end
    it "is valid with valid attributes" do
      subject.first_name = "test"
      expect(subject).to be_valid
    end
    it "is valid with valid attributes" do
      subject.last_name = "test"
      expect(subject).to be_valid
    end
    it "is valid with valid attributes" do
      subject.password = "test@123"
      expect(subject).to be_valid
    end
	end

	describe 'Associations' do
    it "should belongs to secret code" do
    t = User.reflect_on_association(:secret_code)
    expect(t.macro).to eq(:belongs_to)
  end
	end
end
