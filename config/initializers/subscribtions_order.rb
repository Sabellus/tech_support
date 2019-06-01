# module ActionCable
#   module Connection
#     # Collection class for all the channel subscriptions established on a given connection. Responsible for routing incoming commands that arrive on
#     # the connection to the proper channel.
#     class Subscriptions 
#       private
#         def find(data)
#           binding.pry
#           # ident = JSON.parse()
#           if subscription = subscriptions[data["identifier"]]
#             subscription
#           else
#             raise "Unable to find subscription with identifier: #{data['identifier']}"
#           end
#         end
#     end
#   end
# end