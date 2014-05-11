class Admin::NightCardsController < Admin::Backend
  
  def index
    @night_cards = NightCard.all :order => "id desc"
  end

  def new
    @night_card = NightCard.new
  end

  def edit
    @night_card = NightCard.find(params[:id])
  end
  
  def create
    params.permit!
    @night_card = NightCard.new(params[:night_card])
    if @night_card.save
      redirect_to [:admin, :night_cards]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @night_card = NightCard.find(params[:id])
    @night_card.update_attributes(params[:night_card])
    redirect_to [:admin, :night_cards]
  end

  def destroy
    @night_card = NightCard.find(params[:id])
    @night_card.destroy
    redirect_to [:admin, :night_cards]
  end
  
end
