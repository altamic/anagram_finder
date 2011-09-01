AnagramFinder::Application.routes.draw do
  get "dictionary/show"

  get "dictionary/new"

  get "dictionary/create"

  root :to => 'dictionary#show'
  resource :dictionary, :controller => 'dictionary'
end
