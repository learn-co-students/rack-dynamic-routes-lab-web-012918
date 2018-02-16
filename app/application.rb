class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|s| s.name == item_name}
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
#       search_term = req.params["q"]
#       resp.write handle_search(search_term)
#     elsif req.path.match(/cart/)
#       if @@cart == []
#         resp.write "Your cart is empty."
#       else
#         @@cart.each {|thing| resp.write "#{thing}\n"}
#       end
#     elsif req.path.match(/add/)
#       got_item = req.params["item"]
#       if @@items.include?(got_item)
#         @@cart << got_item
#         resp.write "added #{got_item}"
#       else
#         resp.write "We don't have that item."
#       end
#     else
#       resp.write "Path Not Found"
#     end
#
#     resp.finish
#   end
#
#   def handle_search(search_term)
#     if @@items.include?(search_term)
#       return "#{search_term} is one of our items"
#     else
#       return "Couldn't find #{search_term}"
#     end
#   end
# end
