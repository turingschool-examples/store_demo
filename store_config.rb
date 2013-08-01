class StoreConfig
  def self.development_url
    # Make sure this matches the port you're actually
    # running the app on locally
    "http://localhost:3000"
  end

  def self.production_url
    "http://sample-store-demo.herokuapp.com"
  end

  def self.email_address
    # This needs to be the same email address
    # as the one you signed up to the event with
    "you@example.com"
  end
end
