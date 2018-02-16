require "pry"

class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      item_names = @@items.map {|item| item.name}

      if item_names.include?(item_name)
        item = @@items.find do |item|
          item.name == item_name
        end
        resp.write item.price
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
