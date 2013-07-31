class StoreConfig
  def charging?
    RAILS_ENV.production?
  end
end