module APIFrancy
  module V1
    class DatosAPI < ApplicationController #Para que herede las funciones de ocntrolador de API de Ruby
      def index
        datos = datos.order ('dato_id'); #Variable considerando que tengo almacenado el dato en la BD y los ordeno
        render json: { #Para que devuelva el valor. Se crea como objeto
          status: 'Ok', #Para verificar que la petición se cumple
          message: 'Datos cargados',
          data: datos
        }, status: :ok #indica que funcione cuando la petición sea exitosa
  end
end
