require 'rails_helper'

describe Favorite, type: :model do
  describe "relationships" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:station)}
  end
end 
