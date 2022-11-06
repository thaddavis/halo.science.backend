Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3001', 'k8s-rubybe-rubybein-c608ba26fb-1007715162.us-east-1.elb.amazonaws.com', 'https://witherberry.co', 'https://wishbliss.link'
      resource '*', headers: :any, methods: [:get, :post, :delete]
    end
  end