class ProfileController < ApplicationController
  def edit_profile
    @user = User.find(session[:user])
		if request.post?	
			 

			if @user.update(:first_name=>params[:first_name],:last_name=>params[:last_name],:email=>params[:email],:mobile=>params[:mobile],:profile_image=>params[:profile_image])
			 
			flash[:notice] = "Your profile has been reset"
			redirect_to :controller=>"home" , :action=>"dashboard"
			
			else
				render :action=>"edit_profile"
				
			end
		end
  end
  def user_params
	params.permit(:first_name,:last_name,:email,:date_of_birth,:mobile,:profile_image)
 end
end


     
