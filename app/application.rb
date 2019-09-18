require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_to_return = @@items.find{|element| element.name==item}
        # binding.pry

        if item_to_return

        resp.write "#{item_to_return.price}"
      else
        resp.status = 400
        resp.write "Item not found"
     end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
