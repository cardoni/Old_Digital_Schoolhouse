#######  A work in progress -Greg
# 
# class RedirectMagic
#     
#   def initialize(app)
#     @app = app
#   end
# 
#   def call(env)
#     request = Rack::Request.new(env)
# 
#     # if match = request.path.match(/(.*)\/$/)
#     #   [301, {"Location" => match[1]}, self]
#     # else
#     #   @app.call(env)
#     # end
#     
#     
#     
#     if Post.find_by_id(request.params[:id])
#       [301, {"Location" => post_url(@post)}, self]
#     else
#       @app.call(env)
#     end
#     
#   end
#   
#   def each(&block)
#   end  
# end
