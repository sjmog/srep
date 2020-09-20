module Api
  module V1
    class ThingsController < ApplicationController
      def create
        thing = Thing.new(thing_params)
        thing.save

        render json: thing, status: :ok
      end

      private

      def thing_params
        params.require(:thing).permit(:text)
      end
    end
  end
end