class Admin::OrderDetailsController < ApplicationController
 
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    
    # 製作ステータスの自動更新
    if @order_details = @order.order_details

      if @order_details.where(make_status: "製作中").count >= 1
         @order.status = "製作中"
         @order.save
      end

      if @order.order_details.count == @order_details.where(make_status: "製作完了").count
          @order.status = "発送準備中"
          @order.save
      end
        
        flash[:notice] = "変更を保存しました"
        redirect_to admin_order_path(@order_detail.order.id)
    else
      flash[:notice] = "変更を保存しました"
      redirect_to admin_order_path(@order_detail.order.id)
    end
  
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end
  
end
