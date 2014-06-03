Rails.application.routes.draw do
  get 'login',      to: 'account#login'
  get 'authorize',  to: 'account#authorize'
end
