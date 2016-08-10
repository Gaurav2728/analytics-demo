Rails.application.routes.draw do
  get 'top_referrers' => 'stats#top_referrers'
  get 'top_urls' => 'stats#top_urls'

  root to: 'stats#index'
end
