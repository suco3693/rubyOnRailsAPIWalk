class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show, :update, :destroy]
    #GET
    def index
        @fact = Fact.all
        render json: @fact
    end
    #GET 1 fact by :id
    def show
        render json: @users
    end
    #POST fact
    def create
        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else
            render json: {
                error: "Unable to create Factd",
                status: 400
            }, status: 400
        end
    end
    #PUT 1 fact
    def update
        if @fact
            @fact.update(fact_params)
            render json: {
                error: "Fact successfully updated",
                status: 200
            }, status: 200
        else
            render json: {
                error: "Unable to update fact",
                status: 400
            }, status: 400
        end
    end
    #DELETE 1 fact
    def destroy
        if @fact
            @fact.destroy
            render json: {
                error: "Fact deleted",
                status: 200
            }, status: 200
        else
            render json: {
                error: "Unable to delete Fact",
                status: 400
            }, status: 400
        end

    end

    private
    def fact_params
        params.require(:fact).permit(:user, :fact, :likes)
    end

    def find_fact
        @fact = Fact.find(params[:id])
    end
end
