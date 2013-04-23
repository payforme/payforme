class Order < ActiveRecord::Base
  attr_accessible :data, :sphere_id

  def to_struct
    order_hash = JSON.parse data
    convert_to_ostruct_recursive(order_hash, options = {})
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
