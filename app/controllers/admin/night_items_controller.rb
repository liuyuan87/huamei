class Admin::NightItemsController < Admin::Backend
  
  def index
    @night_items = NightItem.all :order => "id desc"
  end

  def new
    @night_item = NightItem.new
  end

  def edit
    @night_item = NightItem.find(params[:id])
  end
  
  def create
    params.permit!
    @night_item = NightItem.new(params[:night_item])
    if @night_item.save
      redirect_to [:admin, :night_items]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @night_item = NightItem.find(params[:id])
    @night_item.update_attributes(params[:night_item])
    redirect_to [:admin, :night_items]
  end

  def destroy
    @night_item = NightItem.find(params[:id])
    @night_item.destroy
    redirect_to [:admin, :night_items]
  end
  
end
