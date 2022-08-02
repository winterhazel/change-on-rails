class PetitionsController < ApplicationController
  def index
    @petitions = Petition.all
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)

    if @petition.save
      redirect_to @petition
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :description, :goal).with_defaults(signatures: 0)
  end
end
