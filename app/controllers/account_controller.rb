class AccountController < ApplicationController
    def signup
        if request.post?
            @user = User.new(user_params)
            if @user.save()
              flash[:notice]="Account is created!!"
              redirect_to :action=>:login
            else
              render :action=>:signup
            end
        end
        
    
    end

    def login
        if request.post?
             @user = User.authenticate(params[:email],params[:password])
             if  @user 
                session[:user] = @user.id
                redirect_to :controller=>:home ,:action=>:dashboard
             else
                flash[:notice] = "invalid password or email"
                render :action=>:login
             end
        end
    
    end

    
   

   

    def logout
       session[:user] =nil
       flash[:notice] = "u are logout!!"
       redirect_to :action=>:login
    end
    private
     def user_params
        params.permit(:first_name,:last_name,:email,:date_of_birth,:password,:hashed_password,:mobile)
     end
end
