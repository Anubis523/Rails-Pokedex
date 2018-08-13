class PokemonsController < ApplicationController
  #Show All
  def index
    @pokemons = Pokemon.all
    # render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    # byebug
    @pokemon = Pokemon.create(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type, :weight)
  end


end
