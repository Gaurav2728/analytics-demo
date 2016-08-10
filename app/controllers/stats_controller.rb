class StatsController < ApplicationController
  def index
  end

  def top_urls
    respond_to do |format|
      format.html
      format.json do
        top_entries
      end
    end
  end

  def top_referrers
    respond_to do |format|
      format.html
      format.json do
        top_entries
      end
    end
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
