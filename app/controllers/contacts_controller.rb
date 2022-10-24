class ContactsController < ApplicationController
    # GET request to /contact-us
    # show new contact form
    def new
        @contact = Contact.new
    end
    
    # POST request to /contacts
    def create
        # Mass assignment of form fields into Contact Object
        @contact = Contact.new(contact_params)
        # Save contact object to database
        if @contact.save
            # Store form fields via paramaters into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Plug variables into Contact Mailer email method
            # and send email
            ContactMailer.contact_email(name, email, body).deliver
            #Display success message in flash hash
            # and redirect to new action
            flash[:success] = "Message sent."
            redirect_to submitted_path
        else
            # If Contact object doesn't save
            # store errors in flashhash and redirect to 
            # new action
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private
    # To collect data from form, we need to use
    # strong paramaters and whitelist form fields
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end