Dummy::Application.routes.draw do
  resource :drawings
  get 'sketchily', :to => 'sketchily#sketchily'
  get 'sketchily_tag', :to => 'sketchily#sketchily_tag'
end
