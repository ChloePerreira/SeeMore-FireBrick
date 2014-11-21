require 'rails_helper'

describe Provider do
  describe '.validates' do
    it 'uid must be present' do
      expect(Provider.new(uid: nil).valid?).to eq false
    end
  end
end
