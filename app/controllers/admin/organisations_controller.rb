class Admin::OrganisationsController < Admin::AdminController

    def new
        @org = Organisation.new
    end

    def edit
        @org = Organisation.find(params[:id])
    end

    def update
  
        @org = Organisation.find(params[:id])
          if(@org.update(org_params))
            redirect_to supply_organisations_path, success: 'Организация успешно обнавлена'
            else
                render :edit
                flash[:danger] = 'Организация не обнавлена'
            end
        end
    
    def destroy
        @org = Organisation.find(params[:id])
        @org.destroy
       
        redirect_to supply_organisations_path,  success: 'Организация успешно удалена'
    end

    def create
        # @sert =Sert.all
        # @prof =Prof.all
        @org = Organisation.new(org_params)      
        if(@org.save)
        redirect_to supply_organisations_path, success: 'Организация успешно добавлена'
        else
            flash[:danger] = 'Организация не добавлена'
            render :new
        end
    end

    private def org_params
        params.require(:organisation).permit(:name)
    end

end
