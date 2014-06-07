require 'spec_helper'

describe Message do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @message = user.messages.new(content: Faker::Lorem.sentence(3))
  end

  subject { @message }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @message.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @message.content = " " }
    it { should_not be_valid }
  end
end
