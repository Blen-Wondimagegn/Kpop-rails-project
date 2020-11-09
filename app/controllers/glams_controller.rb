class GlamsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_glam, only: [:show, :edit, :update, :destroy]
    def index 
     if params[:artist_id]
      if Artist.find_by(id: params[:artist_id])
        @glams = Artist.find(params[:artist_id]).glams
      else
        redirect_to artists_path
      end
    else  
      @glams = Glam.all
    end
 end  

    def show
    if Glam.find_by(id: params[:id])
      @glam = Glam.find(params[:id])
      if params[:artist_id]
        unless Artist.find(params[:artist_id]).glams.include?(@glam)
          redirect_to artist_glam_path(params[:artist_id])
        end
      end
    else
      if params[:artist_id]  
        redirect_to artist_glam_path(params[:artist_id])
      else
        redirect_to glams_path
      end
    end   
 end

    def new
      @glam = Glam.new
    end 

    def create 
      @glam = current_user.glams.build(glam_params)
      if @glam.save
        redirect_to @glam 
      else
        render :new
      end
    end 

  def edit
  end

  def update
    @glam.update(glam_params)
      if @glam.save
        redirect_to @glam 
      else
         render :edit
     end
  end

  def destroy
    @glam.destroy
    flash[:notice] = "Glam Squad deleted."
    redirect_to glams_path
  end
 
  private 

    def set_glam
     @glam = Glam.find_by_id(params[:id])
    end 

  def glam_params
  params.require(:glam).permit(:glam_squad, :makeup, :hair, :wardrobe, :artist_name)
 end 

end