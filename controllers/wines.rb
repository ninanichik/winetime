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

  def update_wine(id, name, wine_variety, produced_year, produced_place)
    @wine = Wines
    @u = @wine.find(id)
    @u.update(name: name, wine_variety: wine_variety, produced_year: produced_year, produced_place: produced_place)
    @u.save

  end

  def get_wine(id)
    Wines.find(id)
  end

  def delete_wine(id)
    @wine = Wines.find(id)
    @wine.destroy
  end
end