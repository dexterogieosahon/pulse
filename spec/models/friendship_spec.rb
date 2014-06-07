require 'spec_helper'

describe Friendship do

  describe "friendship members" do
    it { should respond_to(:user_id) }
    it { should respond_to(:friend_id) }
  end

end