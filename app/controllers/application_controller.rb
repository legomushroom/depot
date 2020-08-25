class ApplicationController < ActionController::Base
    before_action :authorize
    before_action :set_locale

    protected

        def authorize
            unless User.find_by(id: session[:user_id])
                redirect_to login_url, notice: 'Sign in to proceed.'
            end
        end

        def set_locale
            loc = params[:locale]
            if loc
                if I18n.available_locales.map(&:to_s).include?(loc)
                    I18n.locale = loc
                else
                    flash.now[:notice] = "#{loc} translation is not available"
                    logger.error flash.now[:notice]
                end
            end
        end
end
