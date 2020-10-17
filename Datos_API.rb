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
      
      #Metodo para obtener un dato (para poder usar luego el GET)
      def show
        dato = dato.find(params[:id])
        render json: { #Para que devuelva el valor. Se crea como objeto
          status: 'Ok', #Para verificar que la petición se cumple
          message: 'Dato cargado',
          data: dato
        }, status: :ok #indica que funcione cuando la petición sea exitosa
      end
      
      def create
        dato = dato.new(dato_params)
        if dato.save
         render json: { #Para que devuelva el valor. Se crea como objeto
          status: 'Ok', #Para verificar que la petición se cumple
          message: 'Dato creado',
          data: dato
        }, status: :ok #indica que funcione cuando la petición sea exitosa
                
        else
          render json: { #Para que devuelva el valor. Se crea como objeto
          status: 'Error',
          message: 'Dato no creado',
          data: dato.errors
        }, status: :unprocessable_entity
        end      
        
      end
      #Parametros a utilizar para crear (para luego poder usar el POST)
      private
       def dato_params
       params.permit (:id, :dato_id) 
      end
      
      def update #(para luego poder usar el PUT)
        dato = dato.find(params[:id])
        if dato.update_attributes(dato_params)
          render json: { #Para que devuelva el valor. Se crea como objeto
          status: 'Ok', #Para verificar que la petición se cumple
          message: 'Dato actualizado',
          data: dato
        }, status: :ok #indica que funcione cuando la petición sea exitosa
        else
          render json: {
          status: 'Error',
          message: 'Dato no actualizado',
          data: dato.errors
        }, status: :unprocessable_entity   
        end
        
      end  
      
    end
  end
end
