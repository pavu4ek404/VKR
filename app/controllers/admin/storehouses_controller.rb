class Admin::StorehousesController < Admin::AdminController 

def new
    @store = Storehouse.new
end

def edit
    @store = Storehouse.find(params[:id])
end

def update

    @store = Storehouse.find(params[:id])
      if(@store.update(store_params))
        redirect_to supply_storehouses_path, success: 'Склад успешно обнавлен'
        else
            render :edit
            flash[:danger] = 'Склад не обнавлен'
        end
    end

def destroy
    @store = Storehouse.find(params[:id])
    @store.destroy
   
    redirect_to supply_storehouses_path,  success: 'Склад успешно удален'
end

def create

    @store = Storehouse.new(store_params)      
    if(@store.save)
    redirect_to supply_storehouses_path, success: 'Склад успешно добавлен'
    else
        flash[:danger] = 'Склад не добавлен'
        render :new
    end
end

private def store_params
    params.require(:storehouse).permit(:peopl_id,:peopl1_id,:requirement_id,:cut_id, :name)
end
end
