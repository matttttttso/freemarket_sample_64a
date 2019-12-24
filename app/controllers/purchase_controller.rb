class PurchaseController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_address
  before_action :set_card
  before_action :set_payjp_info

  def index
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy'
  )
    if @item.update(trade_state: '売却済み', buyer_id: current_user.id)
      redirect_to action: 'done'
    else
      redirect_to action: 'index'
    end
  end

  def done
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  private

  def set_card
    @card = current_user.card
  end

  def set_payjp_info
    Payjp.api_key = ENV.fetch("PAYJP_PRIVATE_KEY")
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_address
    @address = current_user.address
  end
end
