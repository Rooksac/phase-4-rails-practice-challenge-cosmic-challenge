class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    def render_not_found_response(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

    def render_unproccessable_entity_response(exception)
        render json: {errors: ["validation error"]}, status: 422
    end
end
