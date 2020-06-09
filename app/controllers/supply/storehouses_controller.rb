class Supply::StorehousesController < ApplicationController
    def index
        @store = Storehouse.all 
        
    end
    def searchstore
        @parameters = params[:searchstore] 
        @store = Storehouse.joins(:peopl,:cut).where("storehouses.name= :searchstore", searchstore: @parameters)  
    end
end

