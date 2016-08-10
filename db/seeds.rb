entries = [
  {
    url: "http://apple.com",
    referrer: "http://apple.com"
  },
  {
    url: "http://developer.apple.com",
    referrer: "http://apple.com"
  },
  {
    url: "http://developer.apple.com",
    referrer: "http://apple.com"
  },
  {
    url: "http://developer.apple.com"
  },
]

entries.each do |entry|
  Entry.create(url: entry[:url], referrer: entry[:referrer])
end
