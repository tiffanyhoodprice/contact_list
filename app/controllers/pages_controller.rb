class PagesController < ApplicationController
  
  def index
    @contacts = Contact.all
    # @contact_directory = []
    # @contacts.each do |contact|
    #   @contact_directory << contact
    # end
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
  end
  
  # def form_display

  # end

  # def form_result 
  #   first_name = params[:first_name]
  #   last_name = params[:last_name]
  #   email = params[:email]
  #   phone_number = params[:phone_number]
  #   Contact.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number)
  # end

  def new
   first_name = params[:first_name]
   last_name = params[:last_name]
   email = params[:email]
   phone_number = params[:phone_number]
   Contact.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number)
  end

  def create
     first_name = params[:first_name]
     last_name = params[:last_name]
     email = params[:email]
     phone_number = params[:phone_number]
     contact = Contact.create(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number)
     redirect_to "/contacts/#{contact.id}"
  end

  def show
    id = params[:id]
    @contact = Contact.find_by(id: id)
  end

  def edit
    id = params[:id]
    @contact = Contact.find_by(id: id)
  end

  def update
    id = params[:id]
    contact = Contact.find_by(id: id)
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
    contact.update(first_name: first_name, last_name: last_name, email: email, phone_number: phone_number)
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.destroy
    redirect_to "/contacts"
  end

end