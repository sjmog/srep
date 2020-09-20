module Api
  module V1
    class ThingsController < ApplicationController
      def create
        thing = Thing.create(thing_params)

        render json: thing, status: :ok
      end

      private

      def thing_params
        params.require(:thing).permit(:text, :webhook_url)
      end
    end
  end
end