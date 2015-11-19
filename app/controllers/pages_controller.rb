class PagesController < ApplicationController
  
  def index
    @contacts = Contact.all
    # @contact_directory = []
    # @contacts.each do |contact|
    #   @contact_directory << contact
    # end
    first_name = params[:first_name]
    middle_name = params[:middle_name]
    last_name = params[:last_name]
    email = params[:email]
    address = params[:address]
    phone_number = params[:phone_number]
    bio = params[:bio]
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
   middle_name = params[:middle_name]
   last_name = params[:last_name]
   email = params[:email]
   address = params[:address]
   phone_number = params[:phone_number]
   bio = params[:bio]
   Contact.create(first_name: first_name, middle_name: middle_name,last_name: last_name, email: email, address: address, phone_number: phone_number, bio: bio)
  end

  def create
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    first_name = params[:first_name]
    middle_name = params[:middle_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
    bio = params[:bio]
    latitude = coordinates[0]
    longitude = coordinates[1]
    contact = Contact.create(first_name: first_name, middle_name: middle_name, last_name: last_name, email: email, address: address, phone_number: phone_number, bio: bio, latitude: latitude, longitude: longitude)

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
    address = params[:address]
    coordinates = Geocoder.coordinates(address)
    id = params[:id]
    contact = Contact.find_by(id: id)
    first_name = params[:first_name]
    middle_name = params[:middle_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
    bio = params[:bio]
    latitude = coordinates[0]
    longitude = coordinates[1]
    contact.update(first_name: first_name, middle_name: middle_name,last_name: last_name, email: email, address: address, phone_number: phone_number, bio: bio, latitude: latitude, longitude: longitude)
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.destroy
    redirect_to "/contacts"
  end

end