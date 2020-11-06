class ArtistsController < ApplicationController
before_action :authenticate_user!
# except:[]
    before_action :set_artist, only: [:show, :edit, :update, :destroy]
    def index  
     @artists = Artist.all
    end  

    def show
    
    end 

    def female 
         @females = Artist.female_artists
    end

    def male
      @males = Artist.male_artists
    end 

    def new 
        @artist = Artist.new  
        @artist.glams.build 
    end 
    
    # def home

    # end

    def create
        @artist = Artist.new(artist_params)   
        if @artist.save
            redirect_to @artist
            #  binding.pry
        else   
            render :new
        end 
   end 

   def edit 
    
   end

   def update 
    #  binding.pry
       set_artist
     @artist.update(artist_params)
        if @artist.save
          redirect_to @artist
        else
        render :edit
      end
   end 

    def destroy
      @artist.destroy
      flash[:notice] = "Kpop deleted."
      redirect_to artists_path
    end


    private 

    def set_artist
     @artist = Artist.find_by_id(params[:id])
    end 

    def artist_params
      params.require(:artist).permit(:name, :gender, :height, :age, glams_attributes: [:glam_squad,:makeup, :hair, :wardrobe])
    end 
end
