require 'singleton'
require './models/wines'

class WinesControllers
  include Singleton

  def show_wines
    @wines = Wines.all.map do |wine|
      "Wine id: #{wine.id}, name: #{wine.name}, wine_variety: #{wine.wine_variety}, produced_year: #{wine.produced_year} and produced_place: #{wine.produced_place}"
    end
  end

  def add_new_wine(name, wine_variety, produced_year, produced_place, created_at)
    @new_wine = Wines.create(params[name],
                             params[wine_variety],
                             params[produced_year],
                             params[produced_place],
                             params[created_at])
    erb :sent
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