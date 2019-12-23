class ShowController < ApplicationController
  def index
  end

  def detail_content
    @item = Item.find_by(params[:id])
    @user = User.find_by(params[:id])
    @address = Address.find_by(params[:id])
    @image = Item.find_by(params[:id])
    @prefecture = Prefecture.find_by(id: @address.prefecture_id)
    
  end

  
end
