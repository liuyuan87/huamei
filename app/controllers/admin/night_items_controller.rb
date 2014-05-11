class Admin::NightItemsController < Admin::Backend
  
  before_action :find_night_card
  
  def index
    @night_items = @night_card.night_items
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
    @night_item.night_card = @night_card
    if @night_item.save
      redirect_to [:admin, :night_card, :night_items]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @night_item = NightItem.find(params[:id])
    @night_item.update_attributes(params[:night_item])
    redirect_to [:admin, :night_card, :night_items]
  end

  def destroy
    @night_item = NightItem.find(params[:id])
    @night_item.destroy
    redirect_to [:admin, :night_card, :night_items]
  end
  
private

  def find_night_card
    @night_card = NightCard.find(params[:night_card_id])
  end
  
end
