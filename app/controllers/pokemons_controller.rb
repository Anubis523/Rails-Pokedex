class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render :index
  end

  def new
    @pokemon = Pokemon.new # unintialized Pokemon
    render :new
  end

  def edit
    @pokemon = Pokemon.find(params[:id]) # initialized Pokemon
    render :edit
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(pokemon_params)

    if @pokemon.save
      redirect_to "/pokemons/#{@pokemon.id}"
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    # you don't have to redirect if you don't want to. 
    # you can render in any of these controller actions
    # render :spaghetti
    redirect_to pokemons_path # '/pokemons'
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :element_type, :weight)
  end
end
