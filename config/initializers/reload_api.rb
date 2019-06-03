# if Rails.env.development?
#   ActiveSupport::Dependencies.explicitly_unloadable_constants << 'TechSupportAPI::API'

#   api_files = Dir[Rails.root.join('app', 'api', '**', '*.rb')]
#   api_reloader = ActiveSupport::FileUpdateChecker.new(api_files) do
#     Rails.application.reload_routes!
#   end
#   ActiveSupport::Reloader.to_prepare do
#     api_reloader.execute_if_updated
#   end
# end

if Rails.env == "development"
  lib_reloader = ActiveSupport::FileUpdateChecker.new(Dir["lib/**/*"]) do
    Rails.application.reload_routes! # or do something better here
  end
  
  ActiveSupport::Reloader.to_prepare do
    lib_reloader.execute_if_updated
  end
end