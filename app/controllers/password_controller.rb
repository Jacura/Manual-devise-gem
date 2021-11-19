class PasswordController < ApplicationController

    def forget_password
        if request.post?
            @user = User.find_by_email(params[:email])
              if @user
                  new_password = random_password
                  @user.update(:password=>new_password)
                  # UserNotifier.random_password_send(@user,new_password).deliver
                  flash[:notice] = "A new password has been sent your email"
                 redirect_to :controller => "account" ,:action=>"login"
              else
                 flash[:notice]="Invalid Email.Please enter correct email"
                 render :action=>"forget_password"
              end
          
        end
    end
      

      def reset_password
		@user = User.find(session[:user])
   
		
		if request.post?			
			if @user
                puts "====================================================== #{params[:password]} #{@user.inspect}"	
			@user.update(:password=>params[:password])
			# UserNotifier.reset_password_confirmation(@user).deliver
			flash[:notice] = "Your password has been reset"
			redirect_to :controller => "account", :action => "login"
			
			else
				render :action=>"reset_password"
				
			end
		end
		
	end
	
	def random_password
        (0...8).map{65.+(rand(25)).chr}.join 
    end

    def user_params
        params.permit(:first_name,:last_name,:email,:date_of_birth,:password,:hashed_password,:mobile)
    end
end
