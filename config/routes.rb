Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'posts' do
        post 'create', to:'posts#create'
        get 'show/:id', to: 'posts#show'
      end
    end
  end
end
