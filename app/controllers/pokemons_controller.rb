class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    # render :index
    #implicit render (index, show, new, edit)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end
  #information comes from the form rendered by 'new', goes to 'create'
  def create
    # byebug
    poke = Pokemon.create(pokemon_params)
    redirect_to pokemon_path(poke)
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    poke = Pokemon.find(params[:id])
    poke.update(pokemon_params)
    redirect_to pokemon_path(poke)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type, :weight)
  end
end
