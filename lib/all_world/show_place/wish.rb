module AllWorld
	module ShowPlace
		class Wish
			
			attr_accessor :user, :showplace_id, :country_ids, :session

			def initialize(user, showplace_id, country_ids, session)
				@user 				= user
				@showplace_id = showplace_id.to_i
				@country_ids  = country_ids.map(&:to_i) rescue nil
				@session 			= session
			end

			def run!
				user ? process_for_user : process_for_guest
			end

		private

			def process_for_user
				user.placenets.where(showplace_id: showplace_id).delete_all

				if country_ids && country_ids.any?
          placeda.countries = country_ids
          placeda.save
        else
          placeda.destroy if !placeda.new_record?
        end

        placeda
			end

			def process_for_guest
				session[:placedas] ||= []
        session[:placenets] ||= []
        session[:placedascountries] ||= []

        if country_ids && country_ids.any?
          unless session[:placedas].include?(showplace_id)
            session[:placedas] << showplace_id
            session[:placedascountries][showplace_id] = [] if session[:placedascountries][showplace_id].nil?
            session[:placedascountries][showplace_id] = country_ids
            session[:placenets].delete(showplace_id)
          else
            session[:placedascountries][showplace_id] = country_ids.map(&:to_i)
          end
        else
          session[:placedas].delete(showplace_id)
          session[:placedas].delete(showplace_id.to_s)
          session[:placedascountries].delete(showplace_id)
          session[:placedascountries].delete(showplace_id.to_s)
        end
			end

		protected

			def showplace
				@_showplace ||= Showplace.find showplace_id
			end

			def placeda
				@_placeda ||= (find_placeda || new_placeda)
			end

			def find_placeda
				user.placedas.find_by_showplace_id showplace_id
			end

			def new_placeda
				user.placedas.new showplace_id: showplace_id
			end

		end
	end
end
