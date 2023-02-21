class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by({"email" => params["email"]})
        if @user
            #if params["password"] == @user["password"]
            if BCrypt::Password.new(@user["password"]) == params["password"]
                cookies["monster"] = "me like cookies"
                redirect_to "/companies"
            else 
                redirect_to "/sessions/new"
            end
        else
            redirect_to "/sessions/new"
        end
    end
end
