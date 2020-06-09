class Mining::WorksController < Mining::MiningController
    def index
            @work = Work.all
            respond_to do |format|
            format.html
            format.csv {send_data @work.to_csv}
            format.xls # { send_data @work.to_csv(col_sep: "\t") }
            end    
    end
    def import
        Work.import(params[:file])
        redirect_to mining_works_path, notice: "Работа добавленв."
      end
    def searchwork
        @work = Work.joins( well: :cut )
        @parameters = params[:searchwork] 
        @work = Work.joins( well: :cut ).where("cuts.name = 
            :searchwork", searchwork: @parameters)  
    end
    def search_between
        @params1 = params[:search1]
        @params2 = params[:search2]
        @work_search = Work.where("works.time between :search1 AND 
            :search2", search1: @params1, search2: @params2)
        respond_to do |format|
        format.html
        format.csv {send_data @work_search.to_csv}
        format.xls # { send_data @work_search.to_csv(col_sep: "\t") }
        end
    end 
    def new  
        @work = Work.new 
    end
    def edit 
        @work = Work.find(params[:id]) 
    end
    def update
        @work = Work.find(params[:id])
        if(@work.update(work_params))
        redirect_to mining_works_path, success: 'Работа успешно обновлена'
        else
        flash[:danger] = 'Работа не обновлена'
        render :edit
        end
    end

    def destroy
        @work = Work.find(params[:id])
        @work.destroy    
        redirect_to mining_works_path, success: 'Работа успешно удалена'
    end
    
      def create
        @work = Work.new(work_params)    
        if(@work.save)
        redirect_to mining_works_path success: 'Работа успешно создана'
        else
         flash[:danger] = 'Работа не созданна'
         render :new
        end
    end
       private def work_params
           params.require(:work).permit(:well_id,:peopl_id,:peopl1_id,:time, :quantity)
       end
end
    