module Api
  class CountriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_country, only: %i[ show edit update destroy ]

    def index
      @countries = Country.all
    end

    def show; end

    def new
      @country = Country.new
    end

    def edit; end

    def create
      @country = Country.new(country_params)

      if @country.save
        @countries = Country.all
        render 'api/countries/index', status: :created, location: @country
      else
        render json: @country.errors, status: :unprocessable_entity
      end

    end

    def update
      if @country.update(country_params)
        @countries = Country.all
        render 'api/countries/index', status: :ok, location: @country
      else
        render json: @country.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @country.destroy

      render 'api/countries/show'

    end

    private

    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :fact)
    end
  end
end
