class RecommendationsController < ApplicationController
  def create
    require 'json'

    @user = User.find_by(id: refer_params[:id])
    if @user
      # 获取用户喜好
      # user_preference = refer_params[:user_preference]
      # user_preference = "麻辣 川菜"

      transactionItems = TransactionItem.where(user_id: refer_params[:id])
      if transactionItems
        logger.tagged("product") { logger.debug "" }
        # dish_descriptions = []
        # transactionItems.each do |transactionItem|
        #   dish = {"id": transactionItem[:product_id],
        #                                     'name': "#{Product.find(transactionItem[:product_id]).product_name}",
        #                                     'taste': "#{Product.find(transactionItem[:product_id]).taste}",
        #                                     'type': "#{Product.find(transactionItem[:product_id]).product_type}"}
        #   user_taste_hash[Product.find(transactionItem[:product_id]).taste] += 1
        #   user_type_hash[Product.find(transactionItem[:product_id]).product_type] += 1
        #   # dish = JSON.generate(dish)
        #   logger.tagged("dish") { logger.debug "#{dish}" }
        #   dish_descriptions << dish
        # end
        # user_taste = user_taste_hash.max_by { |k, v| v }
        # user_type = user_type_hash.max_by { |k, v| v }
        # if !user_type.nil? and !user_taste.nil?
        #   user_preference = user_taste[0].to_s + " " + user_type[0].to_s
        # else
        #   user_preference = ""
        # end
        # logger.tagged("user_preference") { logger.debug "#{user_preference}" }
        #
        # json_data = JSON.generate(dish_descriptions)
        # # json_data = dish_descriptions
        # logger.tagged("dish_descriptions") { logger.debug "#{json_data}" }
        # @python_script = Rails.root.join('app', 'views', 'products', 'test.py')
        # # @output = `D:/Anaconda3/python.exe #{@python_script} #{json_data} #{user_preference}`.force_encoding('gbk')
        # @output = `python3 #{@python_script} #{json_data} #{user_preference}`.force_encoding('gbk')
        #
        # product_array = JSON.parse(@output)
        products = Hash.new(0)
        transactionItems.each do |transactionItem|
          logger.tagged("dish_descriptions") { logger.debug "#{transactionItem[:product_id]}" }
          if products[transactionItem[:product_id]]
            products[transactionItem[:product_id]] += 1
          else
            products[transactionItem[:product_id]] = 1
          end
        end
        products = products.sort_by { |k, v| v }.reverse
        shop_array = []
        products.each do |product_id|
          shop_id = Product.find(product_id[0])[:shop_id]
          if !shop_array.include?(shop_id)
            shop_array.append(shop_id)
          end
        end

        if shop_array == []
          Product.all.each do |product|
            logger.tagged("product") { logger.debug "#{product[:shop_id]}" }
            if !shop_array.include?(product[:shop_id])
              shop_array.append(product[:shop_id])
            end
          end
          end
        if shop_array.length > 5
          shop_array = shop_array.take(5)
        else
          shop_array = shop_array.take(shop_array.length)
        end
        render json: { recommended_shop_id: shop_array }
      else
        shop_array = []
        render json: { recommended_shop_id: shop_array }
      end

    else
      api_error(status: 401)
    end

  end

  def refer_params
    params.require(:user).permit(:id, :user_preference)
  end
end
