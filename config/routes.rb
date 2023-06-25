Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'posts' do
        post 'create', to:'posts#create'
        get 'show/:id', to: 'posts#show'
        get 'index', to: 'posts#index'
        patch 'update/:id', to:'posts#update'
        delete 'delete/:id', to:'posts#delete'
      end
    end
  end
end
