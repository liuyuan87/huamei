class Admin::MagazinesController < Admin::Backend
  
  def index
    @magazines = Magazine.all :order => "id desc"
  end

  def new
    @magazine = Magazine.new
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end
  
  def create
    params.permit!
    @magazine = Magazine.new(params[:magazine])
    if @magazine.save
      t = Rails.root.join('public', @magazine.zip.to_s.sub('/', ''))
      `unzip #{t} -d #{Rails.root.join('public/upload/magazine', @magazine.folder, 'imgs')}`
      redirect_to [:admin, :magazines]
    else
      render :action => "new"
    end
  end

  def update
    params.permit!
    @magazine = Magazine.find(params[:id])
    @magazine.update_attributes(params[:magazine])
    redirect_to [:admin, :magazines]
  end

  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy
    `rm -R #{Rails.root.join('public/upload/magazine', @magazine.folder)}`
    redirect_to [:admin, :magazines]
  end
  
end
