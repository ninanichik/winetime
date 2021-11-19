require 'singleton'

class WinesControllers
  include Singleton

  def show_wines
    @wines = Wines.all
    erb :wines
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