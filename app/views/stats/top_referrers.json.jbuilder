@result.each do |date, entries|
  json.set! date do
    json.array! entries do |entry|
      json.url entry[:url]
      json.visits entry[:count]
      json.referrers entry.top_referrers do |referrer|
        json.url referrer[:referrer]
        json.visits referrer[:count]
      end
    end
  end
end
