class Admin::PeoplsController < Admin::AdminController
    # before_action :authenticate_user!, except: [:index, :show]
    def new
        @peopl = Peopl.new
    end

    def edit
        @peopl = Peopl.find(params[:id])
    end

    def update
  
        @peopl = Peopl.find(params[:id])
          if(@peopl.update(people_params))
            redirect_to personal_peopls_path, success: 'Человек успешно обнавлен'
            else
                render :edit
                flash[:danger] = 'Человек не обнавлен'
            end
        end
    
    def destroy
        @peopl = Peopl.find(params[:id])
        @peopl.destroy
       
        redirect_to personal_peopls_path,  success: 'Человек успешно удалена'
    end

    def create
   
        @peopl = Peopl.new(people_params)      
        if(@peopl.save)
        redirect_to personal_peopls_path, success: 'Человек успешно добавлен'
        else
            flash[:danger] = 'Человек не добавлен'
            render :new
        end
    end

    private def people_params
        params.require(:peopl).permit(:fn,:sn,:tn,:dolj)
    end

end
