class HerbsController < InheritedResources::Base
  actions :new, :edit, :show, :update


  def index
    if params[:tag]
      herb = Herb.find_by(:id)
      @herbs = Herb.tagged_with(params[:tag]).paginate(:per_page => 8, :page => params[:page])
      @title = ActsAsTaggableOn::Tag.find_by_name(params[:tag]).to_s.titleize
    else
      @herbs = Herb.order(:name).group(:name).paginate(:per_page => 8, :page => params[:page])
      @title = "Traditional Remedies"
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
    params.require(:herb).permit(:name, :latin_name, :description, :tag_list, :tag)
  end
end
