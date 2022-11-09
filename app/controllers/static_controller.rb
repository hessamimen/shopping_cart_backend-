class StaticController < ApplicationController

    def home
        render json: {status: "The API is working"}
    end
end