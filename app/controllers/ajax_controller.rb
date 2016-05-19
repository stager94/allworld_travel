class AjaxController < ApplicationController
  respond_to :html, :json


  def setsize
    testperpaged = $perpaged
    if params[:w].to_i>1599
      session[:perpaged] = 5
      $perpaged = 5
    elsif params[:w].to_i>1199 and params[:w].to_i<1600
      session[:perpaged] = 4
      $perpaged = 4
    elsif params[:w].to_i>991 and params[:w].to_i<1200
      session[:perpaged] = 3
      $perpaged = 3
    elsif params[:w].to_i<992
      session[:perpaged] = 2
      $perpaged = 2
    end
    $countobj = 4*$perpaged
    render text: testperpaged.to_s
  end


  def showhide
    if params[:showed]==t('ajax.hide')
      session[:marqueshow] = false
      render text: t('ajax.show')
    else
      session[:marqueshow] = true
      render text: t('ajax.hide')
    end
  end

  def seenjs
    if Showplace.find(params[:id]).countries.count<2
      @topage = "/seen/"+params[:id]
      redirect_to "/seen/"+params[:id]
    else
      @videlarr = []
      @shplace = Showplace.find(params[:id])
      if current_user
        if shplece = current_user.placevidels.where('showplace_id'=>params[:id]).first
          @videlarr = shplece.countryarray.split(",").map { |s| s.to_i }
        end
      else
        unless session[:placevidelscountries].nil? 
          if session[:placevidelscountries][params[:id].to_i].kind_of?(Array)
            @videlarr = session[:placevidelscountries][params[:id].to_i]
          end
        end
      end
    end
  end

end
