class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_price = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == item_price}
        resp.status = 200
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else !req.path.match(/items/)
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end


end
