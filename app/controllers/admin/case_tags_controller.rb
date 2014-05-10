class Admin::CaseTagsController < Admin::Backend
  
  def index
    @case_tags = CaseTag.all :order => "id desc"
  end

  def new
    @case_tag = CaseTag.new
  end

  def edit
    @case_tag = CaseTag.find(params[:id])
  end
  
  def create
    params.permit!
    @case_tag = CaseTag.new(params[:case_tag])
    if @case_tag.save
      redirect_to [:admin, :case_tags]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @case_tag = CaseTag.find(params[:id])
    @case_tag.update_attributes(params[:case_tag])
    redirect_to [:admin, :case_tags]
  end

  def destroy
    @case_tag = CaseTag.find(params[:id])
    @case_tag.destroy
    redirect_to [:admin, :case_tags]
  end
  
end
