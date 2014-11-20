require 'rails_helper'

describe Subscription do
  describe '.validates' do
    it 'local_id must be present' do
      expect(Subscription.create(user_id: 7, local_id: nil, media: "twitter").valid?).to eq false
    end

    it 'media must be present' do
      expect(Subscription.create(user_id: 7, media: nil, local_id: "307550006").valid?).to eq false
    end

    it 'user_id must be present' do
      expect(Subscription.create(user_id: nil, media: "twitter", local_id: "307550006").valid?).to eq false
    end

    it 'should be created if user_id, local_id, and media are all present' do
      expect(Subscription.create(user_id: 7, media: "twitter", local_id: "307550006").valid?).to eq true
    end

    it 'should not be able to subscribe to the same account twice' do
      Subscription.create(user_id: 7, media: "twitter", local_id: "307550006")
      expect(Subscription.create(user_id: 7, media: "twitter", local_id: "307550006").valid?).to eq false
    end
  end
end
