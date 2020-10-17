Rails.application.routes.draw do
  resource :webhook, only: [:show, :create]
end
