class StatsController < ApplicationController
  def top_urls
    @result = Entry.top_entries.inject({}) do |hash, item|
      hash[item[:date].to_s] ||= []
      hash[item[:date].to_s] << item
      hash
    end
  end
end
