class Admin::SertsController < Admin::AdminController

   def new
       @sert = Sert.new
   end


   def edit
       @sert = Sert.find(params[:id])
   end

   def update
       @sert = Sert.find(params[:id])
         if(@sert.update(sert_params))
           redirect_to personal_serts_path,  success: 'Сертификат успешно обнавлен'
           else
            flash[:danger] = 'Сертификат не обновлен'
            render :edit
           end
       end
   
   def destroy
       @sert = Sert.find(params[:id])
       @sert.destroy
       redirect_to personal_serts_path,  success: 'Сертификат успешно удален'
   end

   def create
       @sert = Sert.new(sert_params)      
       if(@sert.save)
       redirect_to personal_serts_path,  success: 'Сертификат успешно создан'
       else
        flash[:danger] = 'Сертификат не создан'
        render :new
       end
   end

   private def sert_params
       params.require(:sert).permit(:name_sert, :peopl_id)
   end
end
