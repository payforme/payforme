require 'sphere'

class Order

  def initialize(shop, sphere_order_id)
    @sphere_order_id = sphere_order_id
    @project_key = shop.project_key
    client_id = shop.sphere_client_id
    client_secret = shop.sphere_client_secret
    @token = Sphere.login(client_id, client_secret, @project_key)
    @order_data_hash = Sphere.get_order(@token, @project_key, @sphere_order_id)
  end

  def to_struct
    convert_to_ostruct_recursive(@order_data_hash, options = {})
  end

  private
    def convert_to_ostruct_recursive(obj, options)
      result = obj
      if result.is_a? Hash
        result = result.dup
        result.each  do |key, val|
          result[key] = convert_to_ostruct_recursive(val, options) unless options[:exclude].try(:include?, key)
        end
        result = OpenStruct.new result
      elsif result.is_a? Array
         result = result.map { |r| convert_to_ostruct_recursive(r, options) }
      end
      return result
    end
end
