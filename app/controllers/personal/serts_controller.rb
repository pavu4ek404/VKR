class Personal::SertsController < Personal::PersonalController 
   
    def index
        @sert = Sert.joins(:peopl) 
    end
   def show  
        @sert =Sert.find(params[:id])
    end
    def searchsert
        @parameters = params[:searchsert] 
        @sert = Sert.all.where("name_sert= :searchsert OR id= :searchsert", searchsert: @parameters)  
    end
end
