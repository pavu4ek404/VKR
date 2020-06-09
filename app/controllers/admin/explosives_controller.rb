class Admin::ExplosivesController < Admin::AdminController
    def new
        @explosive = Explosive.new
    end

    def edit
        @explosive = Explosive.find(params[:id])
    end
 
    def update
        @explosive = Explosive.find(params[:id])
          if(@explosive.update(explosive_params))
            redirect_to mining_explosives_path,  success: 'Взрывчатка успешно обнавлена'
            else
             flash[:danger] = 'Взрывчатка не обновлена'
             render :edit
            end
        end
    
    def destroy
        @explosive = Explosive.find(params[:id])
        @explosive.destroy
        redirect_to mining_explosives_path,  success: 'Взрывчатка успешно удалена'
    end
 
    def create
        @explosive = Explosive.new(explosive_params)      
        if(@explosive.save)
        redirect_to mining_explosives_path,  success: 'Взрывчатка успешно создана'
        else
         flash[:danger] = 'Взрывчатка не создана'
         render :new
        end
    end
 
    private def explosive_params
        params.require(:explosive).permit(:name,:oxygen,:heat,:speed)
    end
 end
 
