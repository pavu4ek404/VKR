class Supply::DeliveriesController < ApplicationController
    def index
        @deli = Deliverie.joins([contract: :organisation],:storehouse)
        respond_to do |format|
        format.html
        format.csv {send_data @deli.to_csv}
        format.xls # { send_data @deli.to_csv(col_sep: "\t") }
        
        end
    end

    def import
        Deliverie.import(params[:file])
        redirect_to mining_works_path, notice: "Поставка добавленв."
      end

    def searchdeli
        @parameters = params[:searchdeli] 
        @deli = Deliverie.joins([contract: :organisation],:storehouse).where("organisations.name= :searchdeli OR storehouses.name= :searchdeli ", searchdeli: @parameters)  
    end
    def search_between2
        @deli = Deliverie.all
        @params1 = params[:search1]
        @params2 = params[:search2]
        @deli = Deliverie.where("deliveries.time between :search1 AND :search2", search1: @params1, search2: @params2)
    end 
    def new
        @deli = Deliverie.new
    end
    def edit
        @deli = Deliverie.find(params[:id])
    end
    def update
        @deli = Deliverie.find(params[:id])
          if(@deli.update(deli_params))
            redirect_to supply_deliveries_path, success: 'Поставка успешно обнавлена'
            else
                render :edit
                flash[:danger] = 'Поставка не обнавлена'
            end
        end
    def destroy
        @deli = Deliverie.find(params[:id])
        @deli.destroy
       
        redirect_to supply_deliveries_path,  success: 'Поставка успешно удалена'
    end
    def create
        @deli = Deliverie.new(deli_params)      
        if(@deli.save)
        redirect_to supply_deliveries_path, success: 'Поставка успешно добавлена'
        else
            flash[:danger] = 'Поставка не добавлена'
            render :new
        end
    end
    private def deli_params
        params.require(:deliverie).permit(:contract_id,:storehouse_id,:time)
    end

end

