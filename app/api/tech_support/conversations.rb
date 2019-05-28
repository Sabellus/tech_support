module TechSupport
  class Conversations < Grape::API
    resource :conversations do
      params do
        requires :type_name
      end
      post do
        declared_params = declared(params)
        
        {
          declared: declared_params,
          params: params,
        }
      end
    end
  end
end

# POST: /api/conversations
# support
# client
# group

# POST: /api/signin
# POST: /api/signup

# POST: /api/rating


