class Admin::CutsController < Admin::AdminController

    
       def new 
            @cut = Cut.new 
       end
    
       def edit 
        @cut = Cut.find(params[:id]) 
       end
    
       def update
           @cut = Cut.find(params[:id])
             if(@cut.update(cut_params))
               redirect_to mining_cuts_path, success: 'Разрез успешно обновлен'
               else
                flash[:danger] = 'Разрез не обновлен'
                render :edit
               end
           end
       
       def destroy
           @cut = Cut.find(params[:id])
           @cut.destroy    
           redirect_to mining_cuts_path, success: 'Разрез успешно удален'
       end
    
       def create
           @cut = Cut.new(cut_params)      
           if(@cut.save)
            redirect_to mining_cuts_path, success: 'Разрез успешно добавлен'
           else
            flash[:danger] = 'Разрез не созданн'
            render :new
           end
       end
    
       private def cut_params
           params.require(:cut).permit(:name)
       end
end
