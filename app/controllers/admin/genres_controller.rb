class Admin::GenresController < ApplicationController
  
 def index
   @genre=Genre.new
 end
 
 def create
   @genre.save
 end
 
 def edit
   
 end

private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
