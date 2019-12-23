class CardController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:delete, :show, :confirmation]
  before_action :set_payjp_info, only: [:pay, :delete, :show]

  def new
  end

  def pay
    if params['payjp-token'].blank?
      redirect_to action: "confirmation"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "confirmation"
  end

  def show
    if @card.blank?
      redirect_to action: "confirmation" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def confirmation
    redirect_to action: "show" if @card.present?
  end

  private

  def set_card
    @card = current_user.card
  end

  def set_payjp_info
    Payjp.api_key = ENV.fetch("PAYJP_PRIVATE_KEY")
  end
end
