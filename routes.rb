#Routes para mi API

Rails.application.routes.draw do
  namespace 'APIFrancy do {
   namespace 'vi' do {
   resources :datos #se accede a la ruta APIFrancy/v1/datos
   end
  end
end
