class PagesController < ApplicationController

  def contact_list
    # @contacts = Contact.all
    # @contact_directory = []
    # @contacts.each do |contact|
    #   @contact_directory << contact
    # end
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    phone_number = params[:phone_number]
  end
  
  def form_display

  end

  def form_result 
  end

end
