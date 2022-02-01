module RandomParams
  def random_params
    {
      name: SecureRandom.uuid,
      wine_variety: SecureRandom.uuid,
      produced_year: SecureRandom.uuid,
      produced_place: SecureRandom.uuid
    }
  end

  def params_null(key)
    random_params[key] = null
  end
end