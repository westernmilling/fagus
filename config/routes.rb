Fagus::Engine.routes.draw do
  resources :categories, :except => :destroy
  resources :item_types, :except => :destroy
  resources :items, :except => :destroy
  resources :unit_of_measures, :except => :destroy
end
