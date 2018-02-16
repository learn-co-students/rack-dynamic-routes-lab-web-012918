require 'pry'
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split("/items/").last
      # binding.pry
      all_items = Item.all.map{|i| i.name}
      if all_items.include?(item)
        # binding.pry
        found_item = Item.all.select {|i| i.name == item}
        resp.write "#{found_item}"
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
