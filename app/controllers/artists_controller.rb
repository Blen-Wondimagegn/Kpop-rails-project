class ArtistsController < ApplicationController
before_action :set_kpop, only: [:show, :edit, :update, :destroy]
    def index  
     @kpops = Kpop.all
    #   binding.pry  
    end  

    def show
    #  redirect_to kpop_path
    end 

    def new 
    @kpop = Kpop.new  
    @kpop.glams.build 

    end 

    def create
        @kpop = Kpop.new(kpop_params)   
        if @kpop.save
            redirect_to @kpop
            #  binding.pry
        else   
            render :new
        end 
   end 

   def edit 
    
   end

   def update 
    #  binding.pry
     set_kpop
     @kpop.update(kpop_params)
        if @kpop.save
          redirect_to @kpop
        else
        render :edit
      end
   end 

    def destroy
      @kpop.destroy
      flash[:notice] = "Kpop deleted."
      redirect_to kpops_path
    end


    private 

    def set_kpop
     @kpop = Kpop.find_by_id(params[:id])
    end 
    def kpop_params
      params.require(:kpop).permit(:name, :gender, :height, :fav_quote, glams_attributes: [:makeup, :hair, :designer])
    end 
end
