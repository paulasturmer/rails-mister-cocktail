class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [:show, :destroy, :edit, :update]

    def index
        @cocktails = Cocktail.all
    end

    def show
        @dose = Dose.new
    end

    def new
        @cocktail = Cocktail.new
    end

    def edit
    end

    def update
        @cocktail.update(cocktail_params)
        if @cocktail.save
          redirect_to cocktails_path
        else
          render :edit
        end
    end

    def create
        @cocktail = Cocktail.new(cocktail_params)
        if @cocktail.save
          redirect_to cocktail_path(@cocktail)
        else
          render :new
        end
      end
    
      def destroy
        @cocktail.destroy
        redirect_to cocktails_path
      end
    
      private
    
      def find_cocktail
        @cocktail = Cocktail.find(params[:id])
      end
    
      def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
      end
end
