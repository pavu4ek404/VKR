class Personal::AllpeoplsController < Personal::PersonalController 
    
  def index
    @allpeopl = Allpeopl.joins(:peopl,:sert,:prof)
     respond_to do |format|
     format.html
     format.csv {send_data @allpeopl.to_csv}
     format.xls # { send_data @allpeopl.to_csv(col_sep: "\t") }
     end    
end

def import
  Allpeopl.import(params[:file])
  redirect_to personal_allpeopls_path, notice: "Человек добавлен."
end

def searchpeoplall
  @parameters = params[:searchpeoplall] 
  @allpeopl = Allpeopl.joins(:peopl,:sert,:prof).where("peopls.fn= 
    :searchpeoplall OR peopls.sn= :searchpeoplall OR peopls.tn= :searchpeoplall OR peopls.dolj= :searchpeoplall OR serts.name_sert= :searchpeoplall OR profs.name_prof = :searchpeoplall", searchpeoplall: @parameters)  
end


def new 
  @allpeopl = Allpeopl.new 
end

def edit 
 @allpeopl = Allpeopl.find(params[:id]) 
end

def update
    @allpeopl = Allpeopl.find(params[:id])
      if(@allpeopl.update(allpeople_params))
        redirect_to personal_allpeopls_path, success: 'Сотрудник успешно обновлен'
        else
         flash[:danger] = 'Сотрудник не обновлен'
         render :edit
        end
    end

def destroy
    @allpeopl = Allpeopl.find(params[:id])
    @allpeopl.destroy    
    redirect_to personal_allpeopls_path, success: 'Сотрудник успешно удален'
end

def create
    @allpeopl = Allpeopl.new(allpeople_params)      
    if(@allpeopl.save)
    redirect_to personal_allpeopls_path success: 'Сотрудник успешно создан'
    else
     flash[:danger] = 'Сотрудник не созданн'
     render :new
    end
end

private def allpeople_params
    params.require(:allpeopl).permit(:peopl_id,:sert_id, :prof_id)
end
end
