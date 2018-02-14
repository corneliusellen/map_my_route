require 'rails_helper'

describe Station, type: :model do
  describe "relationships" do
    it {is_expected.to have_many(:users).through(:favorites)}
  end
end 
