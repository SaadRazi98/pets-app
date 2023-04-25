class PetsController < ApplicationController

  def index 
    @pets = Pet.all 
    render :index
  end 

  def create 
    @pet = Pet.create(
      name: params[:name],
      breed: params[:breed],
      image_url: params[:image_url],
    )
    render :show
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render :show
  end

 

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.update(
      name: params[:name] || @pet.name,
      breed: params[:breed] || @pet.breed,
      image_url: params[:image_url] || @pet.image_url,
    )
    render :show
  end

  def destroy
    @pet = Pet.find_by(id: params[:id])
    @pet.destroy
    render json: { message: "Pet was deleted" }
  end


end
