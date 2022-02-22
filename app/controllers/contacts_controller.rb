class ContactsController < ApplicationController
  include ErrorSerializer
  before_action :set_contact, only: %i[ show update destroy ]

  def index
    @contacts = Contact.most_recent.page(params[:page])

    # render json: @contacts
    paginate json: @contacts ## quando quer usar a paginação da gem
  end

  def show
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      # render json: @contact.errors, status: :unprocessable_entity
      render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      # params.require(:contact).permit(
      #   :name, 
      #   :email, 
      #   :birthdate, 
      #   :kind_id, 
      #   phones_attributes: [:id, :number],
      #   address_attributes: [:id, :street, :city]
      # )
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
