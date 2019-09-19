class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      result = FALSE
      found_item = nil
      @@items.each do |item|
        if req.path == "/items/#{item.name}"
          result = true
          found_item = item
        end
      end
      if result == true
        resp.write "#{found_item.price}"
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
