class GlamsController < ApplicationController
  before_action :set_glam, only: [:show, :edit, :update, :destroy]
    def index 
    #  @glams = Glam.all
    #  if params[:kpop_id]
    #   set_kpop
    #   @glams = @kpop.glams 
    #  else
    #  @glams = Glam.all
    #  end 
     if params[:kpop_id]
      if Kpop.find_by(id: params[:kpop_id])
        @glams = Kpop.find(params[:kpop_id]).glams
      else
        flash[:alert] = "Artist not found"
        redirect_to kpops_path
      end
    else  
      @glams = Glam.all
    end
 end  

    def show
        # binding.pry
        # if params[:kpop_id]
        # set_kpop
        # end
    if Glam.find_by(id: params[:id])
      @glam = Glam.find(params[:id])
      if params[:kpop_id]
        unless Kpop.find(params[:kpop_id]).glams.include?(@glam)
          flash[:alert] = "Song not found"
          redirect_to kpop_glam_path(params[:kpop_id])
        end
      end
    else
      flash[:alert] = "Song not found"
      if params[:kpop_id]  
        redirect_to kpop_glam_path(params[:kpop_id])
      else
        redirect_to glams_path
      end
    end   
 end

    def new
        # binding.pry
        # if params[:kpop_id]
        # set_kpop
        # @glams = @kpop.glams.duild
        # else
        # @glams = Glam.new  
        # end 
        @glam = Glam.new
        # @glams = @kpop.glams.duild
    end 

    def create 
        # binding.pry
    #   if params[:kpop_id]
    #     set_kpop
    #    @glams = @kpop.glams.duild(glam_parmas)
    #     else
    #     @glams = Glam.new  
    #     end
    #     if @glam.save
    #         if @sushi
    #             redirect_to kpop_glam_path(@kpop, @glam)
    #         else
    #             redirect_to @glam
    #         end
    #   else
    #     render :new
      # end  
    @glam = Glam.new(glam_params)
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
    flash[:notice] = "Song deleted."
    redirect_to glams_path
  end
 
  private 
  def set_kpop
     @kpop = Kpop.find_by_id(params[:id])
    end 

    def set_glam
     @glam = Glam.find_by_id(params[:id])
    end 

  def glam_params
  params.require(:glam).permit(:makeup, :hair, :designer, :artist_name)
 end 

end
