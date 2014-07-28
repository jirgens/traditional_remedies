class HerbsController < InheritedResources::Base
  actions :new, :edit, :show, :update

  def index
    if params[:tag]
      @herbs = Herb.tagged_with(params[:tag])
    else
      @herbs = Herb.all.order(:name).group(:name)
    end
  end


  def create
    @herb = Herb.new(herb_params)
    if @herb.save
      flash[:notice] = "The herb was added"
      redirect_to ajirginthesky_path
    else
      flash[:error] = "Try again"
      render :new
    end
  end



  private
  def herb_params
    params.require(:herb).permit(:name, :latin_name, :description, :tag_list)
  end
end
