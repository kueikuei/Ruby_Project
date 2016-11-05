class OrdersController < ApplicationController
  # 不是每個都要使用到set_order方法
  # edit、update、delete、show會用到=>only分類出來
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    # Order為order class，對應到Order Model，對應到資料表的
    # Order Table，產生出一個新的Order物件並存到order實例變數
    
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    # binding pry

  end

  # POST /orders
  # POST /orders.json
  def create
    # params.require(:order).permit(:name, :phone, :description)
    @order = Order.new(order_params)

    respond_to do |format|
      # 如果儲存成功，導回/show頁面
      # save存入資料庫
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      # 下SQL的update指令，一樣也是將params的資料過濾後存到DB
      # binding pry
      if @order.update(order_params)
        # 成功存到show頁面
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 某段程式碼可能經常會被變動時private method
  # 越是常變越要寫成private
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      #binding.pry
      params.require(:order).permit(:name, :phone, :description)
    end
end
