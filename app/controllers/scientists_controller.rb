class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :update, :destroy]
    def index
        scientist = Scientist.all
        render json: scientist
    end

    def show
        render json: @scientist, serializer: ScientistPlanetSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: 201
    end

    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: 202
    end

    def destroy
        @scientist.destroy
        head :no_content
    end
    private 
    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
