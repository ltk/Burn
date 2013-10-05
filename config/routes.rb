Burn::Application.routes.draw do
  unless Rails.env.development?
    match '*path',  :to => 'application#render_404'
  end
end
