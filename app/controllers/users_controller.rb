class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            Signup.confirm_email(@user).deliver

            redirect_to :action => :show, :id => @user.id, notice: 'Cadastro criado com sucesso!'
            #redirect_to @user, notice: 'Cadastro criado com sucesso!'
        else
          render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          redirect_to @user, notice:"Perfil atualizado com sucesso"
        else
          #flash[] = "texto" é a msma coisa q notice: texto
        #   flash[:error] = "Something went wrong"
          render action: :edit
        end
    end
    
    

    def user_params
        params.require(:user).permit(:email, :full_name, :location, :password, :password_confirmation, :bio)
    end
    
    
end