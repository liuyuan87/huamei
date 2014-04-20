class Admin::CasesController < Admin::Backend
  
  def index
    @cases = Case.all :order => "id desc"
  end

  def new
    @case = Case.new
  end

  def edit
    @case = Case.find(params[:id])
  end
  
  def create
    params.permit!
    @case = Case.new(params[:case])
    @case.content = params[:content]
    if @case.save
      @case.save_tags(params[:tags])
      redirect_to [:admin, :cases]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @case = Case.find(params[:id])
    @case.content = params[:content]
    @case.update_attributes(params[:case])
    @case.save_tags(params[:tags])
    redirect_to [:admin, :cases]
  end

  def destroy
    @case = Case.find(params[:id])
    @case.destroy
    redirect_to [:admin, :cases]
  end

  def s_hot
    @case = Case.find(params[:id])
    @case.is_hot = 1
    @case.save
    redirect_to [:admin, :cases]
  end

  def c_hot
    @case = Case.find(params[:id])
    @case.is_hot = 0
    @case.save
    redirect_to [:admin, :cases]
  end
  
end
