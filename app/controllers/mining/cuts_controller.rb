class Mining::CutsController < Mining::MiningController
    def index
        @cut = Cut.all 
    end
    def searchcut
        @parameters = params[:searchcut] 
        @cut = Cut.all.where("id =:searchcut OR name= :searchcut", searchcut: @parameters)  
    end
end
        