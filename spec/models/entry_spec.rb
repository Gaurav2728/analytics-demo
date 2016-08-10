require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#entry_hash' do
    it 'generate hash based on values' do
      entry = build(:entry)

      entry.save

      expect(entry.entry_hash).not_to be_nil
    end
  end

  describe '.last_five_days' do
    it 'returns entries from last five days' do
      old_entry = build(:entry, created_at: Time.now - 10.days).save
      new_entry = build(:entry).save

      expect(Entry.count).to eq(2)
      expect(Entry.last_five_days.all).not_to be_empty
      expect(Entry.last_five_days.all).to include(new_entry)
      expect(Entry.last_five_days.all).not_to include(old_entry)
    end
  end

  describe '.top_entries' do
    it 'returns top entries' do
      most_visited_url = "https://example.com"
      top_date = Date.today
      entry = build(:entry).save
      build(:entry, url: most_visited_url, created_at: top_date).save
      build(:entry, url: most_visited_url, created_at: top_date).save

      top_entry = Entry.top_entries.first
      expect(top_entry[:url]).to eq(most_visited_url)
      expect(top_entry[:date]).to eq(top_date)
      expect(top_entry[:count]).to eq(2)

      lower_entry = Entry.top_entries.last
      expect(lower_entry[:url]).to eq(entry.url)
      expect(lower_entry[:date]).to eq(entry.created_at.to_date)
      expect(lower_entry[:count]).to eq(1)
    end
  end

  describe '#top_referrers' do
    it 'returns top referrers' do
      date = Date.today
      referrer = "https://google.com"
      entry = build(:entry, referrer: referrer, created_at: date).save

      top_referrer = entry.top_referrers.first
      expect(top_referrer[:referrer]).to eq(referrer)
      expect(top_referrer[:count]).to eq(1)
    end
  end
end
