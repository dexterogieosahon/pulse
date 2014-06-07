require 'rails_helper'

describe Comment do

  describe "comment members" do
    it { should respond_to(:user_id) }
    it { should respond_to(:message_id) }
    it { should respond_to(:content) }
  end

end