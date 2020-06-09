class Admin::WellsController < Admin::AdminController
    def new
        @well = Well.new
    end
 
    def edit
        @well = Well.find(params[:id])
    end
 
    def update
        @well = Well.find(params[:id])
          if(@well.update(well_params))
            redirect_to mining_wells_path,  success: 'Скважина успешно обнавлена'
            else
             flash[:danger] = 'Скважина не обновлена'
             render :edit
            end
        end
    
    def destroy
        @well = Well.find(params[:id])
        @well.destroy
        redirect_to mining_wells_path,  success: 'Скважина успешно удалена'
    end
 
    def create
        @well = Well.new(well_params)      
        if(@well.save)
        redirect_to mining_wells_path success: 'Скважина успешно создана'
        else
         flash[:danger] = 'Скважина не создана'
         render :new
        end
    end
 
    private def well_params
        params.require(:well).permit(:name,:explosive_id,:cut_id)
    end
 end
 