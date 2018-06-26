Rails.application.routes.draw do
  get '/assets/*filepath/:filename', to: 'rails_responsive_images/assets#responsive_image'
end
