module AllWorld
  module ShowPlace
    class Seen        

      attr_accessor :user_id, :showplace_id, :country_ids, :session

      def initialize(user_id, showplace_id, country_ids, session)
        @user_id      = user_id
        @showplace_id = showplace_id.to_i
        @country_ids  = country_ids.map(&:to_i) rescue nil
        @session      = session
      end

      def run!
        user ? process_for_user : process_for_guest
      end

    private

      def process_for_user
        user.placenets.where(showplace_id: showplace_id).delete_all
        
        if country_ids.any?
          placevidel.countryarray = country_ids.join(",")
          placevidel.save
        else
          placevidel.destroy if !placevidel.new_record?
        end

        placevidel
      end

      def process_for_guest
        session[:placevidels] = [] if session[:placevidels].nil?
        session[:placenets] = [] if session[:placenets].nil?
        session[:placevidelscountries] = [] if session[:placevidelscountries].nil?

        if country_ids && country_ids.any?
          unless session[:placevidels].include?(showplace_id)
            session[:placevidels] << showplace_id
            session[:placevidelscountries][showplace_id] = [] if session[:placevidelscountries][showplace_id].nil?
            session[:placevidelscountries][showplace_id] = country_ids
            session[:placenets].delete(showplace_id)
          else
            session[:placevidelscountries][showplace_id] = country_ids.map(&:to_i)
          end
        else
          session[:placevidels].delete(showplace_id)
          session[:placevidelscountries].delete(showplace_id)
        end
        
      end

    protected

      def user
        return unless user_id
        @_user ||= User.find user_id
      end

      def showplace
        @_showplace ||= Showplace.find showplace_id
      end

      def placevidel
        @_placevidel ||= (find_placevidel || new_placevidel)
      end

      def find_placevidel
        user.placevidels.find_by_showplace_id(showplace_id)
      end

      def new_placevidel
        user.placevidels.new showplace_id: showplace_id, fullcountryarray: showplace.countries_ids
      end

    end
  end
end
