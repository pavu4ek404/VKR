class Mining::ExplosivesController < Mining::MiningController
    def index
        @explosive = Explosive.all
    end

    def searchexpl
        @parameters = params[:searchexpl] 
        @explosive = Explosive.all.where("name= :searchexpl OR oxygen = :searchexpl OR heat = :searchexpl OR speed = :searchexpl", searchexpl: @parameters)  
    end
end
