Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001', 'http://a848d06f39c6b49aba4263894e84e454-795743795.us-east-1.elb.amazonaws.com'
      resource '*', headers: :any, methods: [:get, :post, :delete]
    end
  end