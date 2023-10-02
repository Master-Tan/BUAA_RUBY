class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    if Shop.find_by(id: product_params[:shop_id])
      @product = Product.create(shop_id: product_params[:shop_id], product_name: product_params[:product_name],
                                retail_price: product_params[:retail_price], favorites: product_params[:favorites],
                                sales: product_params[:sales], description: product_params[:description],
                                product_type: product_params[:product_type], added_time: product_params[:added_time],
                                taste: product_params[:taste])
      if product_params[:image_directory]
        logger.tagged("IMAGE_DIRECTORY") { logger.debug "#{product_params[:image_directory]}" }
        # @image_io = File.open(product_params[:image_directory])
        # @image_base64 = Base64.encode64(@image_io.read)
        # logger.tagged("BASE64") { logger.debug "#{@image_base64}" }
        # logger.tagged("BASE64_END") { logger.debug "" }
        @image_base64 = product_params[:image_directory]
        @image_base64.sub!(/\Adata:image\/(png|jpg|jpeg);base64,/, "")
        logger.tagged("IMAGE_DIRECTORY2") { logger.debug "#{@image_base64}" }
        @image_data = Base64.decode64(@image_base64)
        @image_io = StringIO.new(@image_data)
        blob = ActiveStorage::Blob.create_and_upload!(io: @image_io, filename: "image.png")
        @product.image.attach(blob)
        ActiveStorage::Current.url_options = { host: "127.0.0.1:3000", protocol: "http" }
        logger.tagged("IMAGE") { logger.debug "#{@product.image.url(expires_in: 10.years)}" }
        @product[:image_directory] = "#{@product.image.url(expires_in: 10.years)}"
        @product.save
      end
      api_ok(status: 200)
    else
      api_error(status: 401)
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find(params[:id])
    if @product
      @product.update(shop_id: product_params[:shop_id], product_name: product_params[:product_name],
                                retail_price: product_params[:retail_price], favorites: product_params[:favorites],
                                sales: product_params[:sales], description: product_params[:description],
                                product_type: product_params[:product_type], added_time: product_params[:added_time],
                                taste: product_params[:taste])
      if product_params[:image_directory] and @product[:image_directory] == nil
        logger.tagged("IMAGE_DIRECTORY") { logger.debug "#{product_params[:image_directory]}" }
        # @image_io = File.open(product_params[:image_directory])
        # @image_base64 = Base64.encode64(@image_io.read)
        # logger.tagged("BASE64") { logger.debug "#{@image_base64}" }
        # logger.tagged("BASE64_END") { logger.debug "" }
        @image_base64 = product_params[:image_directory]
        @image_base64.sub!(/\Adata:image\/(png|jpg|jpeg);base64,/, "")
        logger.tagged("IMAGE_DIRECTORY2") { logger.debug "#{@image_base64}" }
        @image_data = Base64.decode64(@image_base64)
        @image_io = StringIO.new(@image_data)
        blob = ActiveStorage::Blob.create_and_upload!(io: @image_io, filename: "image.png")
        @product.image.attach(blob)
        ActiveStorage::Current.url_options = { host: "127.0.0.1:3000", protocol: "http" }
        logger.tagged("IMAGE") { logger.debug "#{@product.image.url(expires_in: 10.years)}" }
        @product[:image_directory] = "#{@product.image.url(expires_in: 10.years)}"
        @product.save
      end
      api_ok(status: 200)
    else
      api_error(status: 401)
    end

  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    api_ok(status: 200)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:shop_id, :product_name, :retail_price,
                                      :favorites, :sales, :description, :image_directory,
                                      :product_type, :added_time, :taste)
    end
end
