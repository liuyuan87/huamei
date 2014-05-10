class Admin::TopicsController < Admin::Backend
  
  def index
    @topics = Topic.all :order => "id desc"
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def create
    params.permit!
    @topic = Topic.new(params[:topic])
    @topic.content = params[:content]
    if @topic.save
      redirect_to [:admin, :topics]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @topic = Topic.find(params[:id])
    @topic.content = params[:content]
    @topic.update_attributes(params[:topic])
    redirect_to [:admin, :topics]
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to [:admin, :topics]
  end
  
end
