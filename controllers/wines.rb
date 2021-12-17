require 'singleton'
require './models/wines'

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

  def get_wine(id)
    Wines.find(id)
  end

  def delete_wine(id)
    @wine = Wine.find(id)
    @wine.destroy
    redirect '/wines'
  end
end