require 'singleton'
require './models/wines'
require 'pry'

class WinesControllers
  include Singleton

  def show_wines
    Wines.all.map{ |x| x.as_json }
  end

  def add_new_wine(name, wine_variety, produced_year, produced_place)
    Wines.create(name: name, wine_variety: wine_variety, produced_year: produced_year, produced_place: produced_place)
  end

  def update_wine(name, wine_variety, produced_year, produced_place, created_at)
    @wine = wine.find(params[:id])
    @wine.update(params[name],
                 params[wine_variety],
                 params[produced_year],
                 params[produced_place],
                 params[created_at])
    @wine.save
    redirect '/wine/'+params[:id]
    erb :sent
  end

  def get_wine
    @wine = Wines.find(params[:id])
    erb :show_wine
  end

  def delete_wine
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect '/wines'
  end
end