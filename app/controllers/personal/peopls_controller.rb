class Personal::PeoplsController < Personal::PersonalController 
    # before_action :authenticate_user!, except: [:index, :show]
    def index
        @peopl = Peopl.all
         respond_to do |format|
         format.html
         format.csv {send_data @peopl.to_csv}
         format.xls # { send_data @peopl.to_csv(col_sep: "\t") }
         end    
    end

    def search
      @parameters = params[:search] 
      @peopl = Peopl.where("fn= :search OR sn= :search OR tn= :search OR dolj= :search ", search: @parameters)  
    end

  def import
    Peopl.import(params[:file])
    redirect_to personal_peopls_path, notice: "Человек добавлен."
  end
end
