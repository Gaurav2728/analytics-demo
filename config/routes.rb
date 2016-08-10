Rails.application.routes.draw do
  get 'top_urls' => 'stats#top_urls', defaults: { format: :json }
  get 'top_referrers' => 'stats#top_referrers', defaults: { format: :json }
end
