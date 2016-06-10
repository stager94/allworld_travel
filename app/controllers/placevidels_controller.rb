class PlacevidelsController < ApplicationController
	
	def multiseen
		use_case 	= AllWorld::ShowPlace::Seen.new(current_user.try(:id), params[:id], params[:country_ids], session)
		showplace = use_case.run!
		redirect_to :back
	end

private

	def load_placevidel
		@placevidel = user_signed_in? ? current_user.placevidels.find_by_showplace_id(params[:id]) : nil
	end

end
