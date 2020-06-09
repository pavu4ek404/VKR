class Admin::RequirementsController < Admin::AdminController 
  
    def new
        @requ = Requirement.new
    end

    def edit
        @requ = Requirement.find(params[:id])
    end

    def update
  
        @requ = Requirement.find(params[:id])
          if(@requ.update(requ_params))
            redirect_to supply_requirements_path, success: 'Требование успешно обнавлено'
            else
                render :edit
                flash[:danger] = 'Требование не обнавлено'
            end
        end
    
    def destroy
        @requ = Requirement.find(params[:id])
        @requ.destroy
        redirect_to supply_requirements_path,  success: 'Требование успешно удалено'
    end

    def create
        # @sert =Sert.all
        # @prof =Prof.all
        @requ = Requirement.new(requ_params)      
        if(@requ.save)
        redirect_to supply_requirements_path, success: 'Требование успешно добавлено'
        else
            flash[:danger] = 'Требование не добавлено'
            render :new
        end
    end

    private def requ_params
        params.require(:requirement).permit(:name,:requi1,:requi2,:requi3,:requi4)
    end


end
