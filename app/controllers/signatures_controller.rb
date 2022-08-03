class SignaturesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
    @signature = @petition.signatures.create(signature_params)
    redirect_to petition_path(@petition)

    # Update the goal
    if @petition.goal - @petition.signatures.size <= 10
      if @petition.goal < 1000
        step = 50
      elsif @petition.goal < 10000
        step = 500
      elsif @petition.goal <= 100000
        step = 5000
      elsif @petition.goal < 1000000
        step = 50000
      else
        step = 500000
      end
      @petition.goal += step
      @petition.save
    end
  end

  private

  def signature_params
    params.require(:signature).permit(:message, :private).with_defaults(user_id: current_user.id)
  end
end
