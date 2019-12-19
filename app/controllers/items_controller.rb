class ItemsController < ApplicationController
  def index
    # 後で実装
    # @items = Item.all.with_attached_images
  end

  def show
    # 後で実装
    # @item = Item.find(params[:id])
  end

  def sell
    @item = Item.new
  end

  def edit
    # 後で実装
  end

  def create
    @item = Item.create!(item_params)
    if @item.save
      redirect_to root_path
    else
      render :sell
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :explain,
      :category,
      :size,
      :brand,
      :condition,
      :postage,
      :shipping_method,
      :prefecture_id,
      :shipping_days,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end
end
