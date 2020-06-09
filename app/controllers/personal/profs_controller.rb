class Personal::ProfsController < Personal::PersonalController 

   def index 
    @prof = Prof.all
   end

   def show   
    @prof =Prof.find(params[:id]) 
   end       
  def serchprof
   @parameters = params[:serchprof] 
   @prof = Prof.all.where("name_prof= :serchprof OR id= :serchprof", serchprof: @parameters)  
end
end
