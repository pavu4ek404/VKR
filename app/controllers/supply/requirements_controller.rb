class Supply::RequirementsController < ApplicationController
    def index
        @requ = Requirement.all
    end
    def searchrequ
        @parameters = params[:searchrequ] 
        @requ = Requirement.where("name= :searchrequ  ", searchrequ: @parameters)  
    end

end
