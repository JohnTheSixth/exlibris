Rails.application.routes.draw do

    root 'home#index'

    get '/newuser' => 'users#new'
    post '/newuser' => 'users#create'
    get '/credits' => 'users#credits'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'

    get '/logout' => 'sessions#destroy'

    get '/reader' => 'home#index'
    post '/reader' => 'reader#parse'

    post '/save' => 'reader#save'
    post '/delete' => 'reader#delete'

    # Goes to Library home where all saved
    # articles are available for viewing
    get '/library' => 'library#home'

    # Goes to reading page in library where
    # saved articles are recalled for reading
    get '/reader/:id' => 'reader#checkout'

    get '/account' => 'users#manage'

    get '/deleteuser' => 'users#delete'
    get '/destroy/:id' => 'users#destroy'

end