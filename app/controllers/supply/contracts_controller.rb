class Supply::ContractsController < ApplicationController
def index
    @contr = Contract.joins(:explosive,:organisation)
end
def searchcontr
    @parameters = params[:searchcontr] 
    @contr = Contract.joins(:organisation,:explosive).where(" contracts.name =:searchcontr OR organisations.name= :searchcontr OR explosives.name= :searchcontr ", searchcontr: @parameters)  
end
def new
    @contr = Contract.new
end
def edit
    @contr = Contract.find(params[:id])
end
def update
    @contr = Contract.find(params[:id])
      if(@contr.update(contr_params))
        redirect_to supply_contracts_path, success: 'Контракт успешно обнавлен'
        else
            render :edit
            flash[:danger] = 'Контракт не обнавлен'
        end
    end
def destroy
    @contr = Contract.find(params[:id])
    @contr.destroy
   
    redirect_to supply_contracts_path,  success: 'Контракт успешно удален'
end
def create

    @contr = Contract.new(contr_params)      
    if(@contr.save)
    redirect_to supply_contracts_path, success: 'Контракт успешно добавлен'
    else
        flash[:danger] = 'Контракт не добавлен'
        render :new
    end
end
private def contr_params
    params.require(:contract).permit(:organisation_id,:explosive_id,:coutn,:price,:name)
end
end

