class Admin::ProfsController < Admin::AdminController 

   def new 
    @prof = Prof.new 
   end
   

   def edit 
    @prof = Prof.find(params[:id]) 
   end

   def update
       @prof = Prof.find(params[:id])
         if(@prof.update(prof_params))
           redirect_to personal_profs_path, success: 'Профессия успешно обновлена'
           else
            flash[:danger] = 'Профессия не обновлена'
            render :edit
           end
       end
   
   def destroy
       @prof = Prof.find(params[:id])
       @prof.destroy    
       redirect_to personal_profs_path, success: 'Профессия успешно удалена'
   end

   def create
       @prof = Prof.new(prof_params)      
       if(@prof.save)
       redirect_to personal_profs_path success: 'Профессия успешно создана'
       else
        flash[:danger] = 'Профессия не созданна'
        render :new
       end
   end

   private def prof_params
       params.require(:prof).permit(:name_prof, :peopl_id)
   end
end
