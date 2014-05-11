class Admin::NightPresentersController < Admin::Backend
  
  def index
    @night_presenters = NightPresenter.all :order => "id desc"
  end

  def new
    @night_presenter = NightPresenter.new
  end

  def edit
    @night_presenter = NightPresenter.find(params[:id])
  end
  
  def create
    params.permit!
    @night_presenter = NightPresenter.new(params[:night_presenter])
    if @night_presenter.save
      redirect_to [:admin, :night_presenters]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @night_presenter = NightPresenter.find(params[:id])
    @night_presenter.update_attributes(params[:night_presenter])
    redirect_to [:admin, :night_presenters]
  end

  def destroy
    @night_presenter = NightPresenter.find(params[:id])
    @night_presenter.destroy
    redirect_to [:admin, :night_presenters]
  end
  
end
