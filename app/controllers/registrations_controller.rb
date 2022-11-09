class RegistrationsController < ApplicationController

    def create
        user = User.new(
            name: params["user"]["name"],
            email: params["user"]["email"],
            password: params["user"]["password"],
            password_confirmation: params["user"]["password_confirmation"]
        )

        if user.save
            session[:user_id] = user.id
            Cart.create(user_id: user.id)

            render json: {
                status: :created,
                user: user
            }
        else
            render json: {errors: user.errors.full_messages}, status: 422
        end

    end
end
