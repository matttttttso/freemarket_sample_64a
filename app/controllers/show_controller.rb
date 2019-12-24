class ShowController < ApplicationController
  def index
  end
  
  def detail_content
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
    @address = Address.find(params[:id])
    @image = Item.find(params[:id])
    @prefecture = Prefecture.find(id: @address.prefecture_id)
  end

end