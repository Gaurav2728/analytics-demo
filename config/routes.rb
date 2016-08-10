Rails.application.routes.draw do
  get 'top_urls' => 'stats#top_urls', defaults: { format: :json }
end
