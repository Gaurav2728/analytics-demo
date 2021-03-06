require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  render_views

  describe '#top_urls' do
    it 'returns top urls in JSON format' do
      date = Date.today
      entry = build(:entry, created_at: date).save

      get :top_urls, format: :json

      json = JSON.parse(response.body)
      expect(json["#{date}"]).to eq(["url" => entry.url, "visits" => 1])
    end
  end

  describe '#top_referrers' do
    it 'returns top referrers in JSON format' do
      date = Date.today
      referrer = "https://google.com"
      entry = build(:entry, referrer: referrer, created_at: date).save

      get :top_referrers, format: :json

      json = JSON.parse(response.body)
      expect(json["#{date}"]).to eq(
        [
          "url" => entry.url,
          "visits" => 1,
          "referrers" => [{
              "url"=>referrer, "visits"=>1
            }]
        ]
      )
    end
  end
end
