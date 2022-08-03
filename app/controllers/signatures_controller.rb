class SignaturesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
    @signature = @petition.signatures.create(signature_params)
    redirect_to petition_path(@petition)
  end

  private

  def signature_params
    params.require(:signature).permit(:message, :private).with_defaults(user_id: current_user.id)
  end
end
