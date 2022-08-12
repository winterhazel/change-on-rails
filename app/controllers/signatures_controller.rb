# frozen_string_literal: true

class SignaturesController < ApplicationController
  def show
    redirect_to petition_path(Petition.find(params[:petition_id]))
  end

  def new
    redirect_to petition_path(Petition.find(params[:petition_id]))
  end

  def create
    @petition = Petition.find(params[:petition_id])

    if can_sign?(@petition)
      @signature = @petition.signatures.create(signature_params)
      redirect_to petition_path(@petition)
      update_goal(@petition)
    else
      # Not logged in/petition not open/user already signed for petition
      redirect_to petition_path(@petition)
    end
  end

  def edit
    redirect_to petition_path(Petition.find(params[:petition_id]))
  end

  private

  def signature_params
    params.require(:signature).permit(:message, :private).with_defaults(user_id: current_user.id)
  end

  def can_sign?(petition)
    user_signed_in? && petition.status == 'open' && petition.signatures.find_by(user_id: current_user.id).nil? && petition.user.id != current_user.id
  end

  def update_goal(petition)
    return unless petition.goal - petition.signatures.size <= 10

    step = case petition.goal
           when 0...1000
             50
           when 1000...10_000
             500
           when 10_000...100_000
             5000
           when 100_000...1_000_000
             50_000
           else
             500_000
           end
    petition.goal += step
    petition.save
  end
end
