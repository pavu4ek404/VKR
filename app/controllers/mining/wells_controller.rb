class Mining::WellsController < Mining::MiningController
    def index
        @well = Well.joins(:cut, :explosive)
    end
    def searchwell
        @parameters = params[:searchwell] 
        @well = Well.all.where("name= :searchwell", searchwell: @parameters)  
    end
end