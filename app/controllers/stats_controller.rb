class StatsController < ApplicationController
  before_action :top_entries
  def top_urls
  end

  def top_referrers
  end

  private

  def top_entries
    @result = Entry.top_entries.inject({}) do |hash, item|
      hash[item[:date].to_s] ||= []
      hash[item[:date].to_s] << item
      hash
    end
  end
end
