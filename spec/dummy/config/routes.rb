Dummy::Application.routes.draw do
  resources :drawings, :only => [:show, :update] do
    member do
      get 'sketchily'
      get 'sketchily_tag'
    end
  end
end
