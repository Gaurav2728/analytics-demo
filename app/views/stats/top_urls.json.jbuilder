@result.each do |date, entries|
  json.set! date do
    json.array! entries do |entry|
      json.url entry[:url]
      json.visits entry[:count]
    end
  end
end
