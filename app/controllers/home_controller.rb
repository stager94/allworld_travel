class HomeController < ApplicationController
  #before_filter :authenticate_user!, :except => [:place, :index, :country, :allbest, :allwonders, :allcountries, :categories, :section, :countries, :clickandgo ]
  respond_to :html, :json

  def glavnaya
    #render :layout => 'lending'
  end


  def index
    countobj = $countobj
    @perpaged = $perpaged
    @placevidels = nil
    @placedas = nil
    @placenets = nil
    usedplace = []
    if current_user
      unless session[:placevidels].nil?
        session[:placevidels].each do |sesplacevidel|
          unless test = current_user.placevidels.where('showplace_id'=>sesplacevidel).first
            placevidel = Placevidel.new
            placevidel.user = current_user
            placevidel.showplace_id=sesplacevidel
            placevidel.countryarray = Showplace.find(sesplacevidel).countries.first.id.to_s
            fullcountryarray = ''
            comma = ''
            Showplace.find(sesplacevidel).countries.order('id ASC').each do |counryid|
              fullcountryarray = fullcountryarray + comma + counryid.id.to_s
              comma = ','
            end
            placevidel.fullcountryarray = fullcountryarray

            placevidel.save
            current_user.placenets.where('showplace_id'=>sesplacevidel).delete_all
          end
        end
        session.delete(:placevidels)
      end
      unless session[:placedas].nil?
        session[:placedas].each do |sesplaceda|
          unless test = current_user.placedas.where('showplace_id'=>sesplaceda).first
            placeda = Placeda.new
            placeda.user = current_user
            placeda.showplace_id=sesplaceda
            placeda.save
            current_user.placenets.where('showplace_id'=>sesplaceda).delete_all
          end
        end
        session.delete(:placedas)
      end
      unless session[:placenets].nil?
        session[:placenets].each do |sesplacenet|
          unless test = current_user.placenets.where('showplace_id'=>sesplacenet).first
            placenet = Placenet.new
            placenet.user = current_user
            placenet.showplace_id=sesplacenet
            placenet.save
            current_user.placedas.where('showplace_id'=>sesplacenet).delete_all
            current_user.placevidels.where('showplace_id'=>sesplacenet).delete_all
          end
        end
        session.delete(:placenets)
      end
      unless current_user.placevidels.first.nil?
        videlplace = current_user.placevidels.select('placevidels.showplace_id as id').to_a
        #nomultvidelplace = current_user.placevidels.select('placevidels.showplace_id as id').where('countryarray = fullcountryarray').to_a
        @placevidels  = Showplace.where(:id => videlplace).page(params[:vidpage]).per(@perpaged)
        @placevidelscount = Showplace.where(:id => videlplace).count
        countobj = countobj -@perpaged
        usedplace << videlplace
      end
      unless current_user.placedas.first.nil?
        daplace = current_user.placedas.select('placedas.showplace_id as id').to_a
        @placedas  = Showplace.where(:id => daplace).page(params[:dapage]).per(@perpaged)
        @placedascount = Showplace.where(:id => daplace).count
        countobj = countobj -@perpaged
        usedplace << daplace
      end
      unless current_user.placenets.first.nil?
        netplace = current_user.placenets.select('placenets.showplace_id as id').to_a
        @placenets  = Showplace.where(:id => netplace).page(params[:netpage]).per(@perpaged)
        @placenetscount = Showplace.where(:id => netplace).count
        countobj = countobj -@perpaged
        usedplace << netplace
      end
      #unless session[:placedas].blank? ->save to base
    else
      unless session[:placevidels].blank?
        @placevidels  = Showplace.where(:id => session[:placevidels]).page(params[:vidpage]).per(@perpaged) 
        @placevidelscount = Showplace.where(:id => session[:placevidels]).count
        countobj = countobj -@perpaged
        usedplace << session[:placevidels]
      end
      unless session[:placedas].blank?
        @placedas     = Showplace.where(:id => session[:placedas]).page(params[:dapage]).per(@perpaged)
        @placedascount = Showplace.where(:id => session[:placedas]).count
        countobj = countobj -@perpaged
        usedplace << session[:placedas]
      end
      unless session[:placenets].blank?
        @placenets    = Showplace.where(:id => session[:placenets]).page(params[:netpage]).per(@perpaged)
        @placenetscount = Showplace.where(:id => session[:placenets]).count
        countobj = countobj -@perpaged
        usedplace << session[:placenets]
      end
    end
    @showplaces = Showplace.for_user(current_user).where(:showhome =>true).where.not(:id =>usedplace).order("RAND(id)").page(params[:shpage]).per(countobj)
  end
  
  def place
    @showplace = Showplace.for_user(current_user).find_by_tag!(params[:tag])
    #@relatedspls = @showplace.countries.first.showplaces.where.not(:id => @showplace.id).page(params[:page]).per($perpaged)
    #@relatedsplscount = @showplace.countries.first.showplaces.where.not(:id => @showplace.id).count

    render :layout => 'fixed'
  end

  def page
    @page = Staticpage.find_by_tag(params[:tag])
  end

  def submenu
    @submenu = Menulast.find_by_tag(params[:tag])
  end

  def country
    @country = Country.find_by_tag(params[:tag])
    @relatedspls = @country.showplaces.for_user(current_user).where('showincountry = 1').order('point DESC').page(params[:page]).per($perpaged*3)
    @relatedsplscount = @country.showplaces.for_user(current_user).where('showincountry = 1').count
    render :layout => 'fixed'
  end

  def allbest
    @showplaces = Showplace.for_user(current_user).where('top100 = 1').page(params[:shpage]).per(20)
    @showplacescount = Showplace.for_user(current_user).where('top100 = 1').count
  end

  def allwonders
    @showplaces = Showplace.for_user(current_user).where('wonders7 = 1').page(params[:shpage]).per(20)
    @showplacescount = Showplace.for_user(current_user).where('wonders7 = 1').count
  end

  def allcountries
    render :layout => 'fixed'
  end

  def categories
    @category = Tag.find_by_name(params[:tag]).content
    @showplaces = @category.showplaces.for_user(current_user).where('showinsection = 1').page(params[:shpage]).per(20)
    @showplacescount = @category.showplaces.for_user(current_user).where('showinsection = 1').count
  end

  def section
    @section = Tag.find_by_name(params[:tag]).content
    @showplaces = @section.showplaces.for_user(current_user).where('showinsection = 1').page(params[:shpage]).per(20)
    @showplacescount = @section.showplaces.for_user(current_user).where('showinsection = 1').count
  end

  def goroda
    @showplaces = Showplace.for_user(current_user).where('itsgorod = 1').page(params[:shpage]).per(20)
    @showplacescount = Showplace.for_user(current_user).where('itsgorod = 1').count
  end


  def countries
    @region = Tag.find_by_name(params[:tag]).content
    @countries = @region.countries
    render :layout => 'fixed'
  end


  def seen
    if current_user
      if @test = current_user.placevidels.where('showplace_id'=>params[:id]).first
        flash[:danger] = "Exist"
        redirect_to :back
      else
        current_user.placenets.where('showplace_id'=>params[:id]).delete_all
        @placevidel = Placevidel.new
        @placevidel.user = current_user
        @placevidel.showplace_id=params[:id]
        @placevidel.countryarray = Showplace.find(params[:id]).countries.first.id.to_s
        fullcountryarray = ''
        comma = ''
        Showplace.find(params[:id]).countries.order('id ASC').each do |counryid|
          fullcountryarray = fullcountryarray + comma + counryid.id.to_s
          comma=','
        end
        @placevidel.fullcountryarray = fullcountryarray
        if @placevidel.save
          redirect_to :back
        else
          redirect_to :back
        end
      end
    else
      session[:placevidels] =[] if session[:placevidels].nil?
      session[:placenets] =[] if session[:placenets].nil?
      unless session[:placevidels].include?(params[:id])
         session[:placevidels] << params[:id]
         session[:placenets].delete(params[:id])
      end
      session[:placevidelscountries] = [] if session[:placevidelscountries].nil?
      session[:placevidelscountries][params[:id].to_i] = [] if session[:placevidelscountries][params[:id].to_i].nil?
      session[:placevidelscountries][params[:id].to_i] = [Showplace.find(params[:id]).countries.first.id]
      redirect_to :back
    end
  end

  def multyseen
    if current_user
      # shplece - Placevid object
      if shplece = current_user.placevidels.where('showplace_id'=>params[:id]).first

        # Full countries array of Placevid object in which user seen this object
        shplccntarr = shplece.countryarray.split(",").map { |s| s.to_i }

        # if country array already contain selected country - delete from list
        if shplccntarr.include?(params[:country].to_i)
          shplccntarr.delete(params[:country].to_i)
        # else - add new country to array
        else
          shplccntarr << params[:country].to_i
        end

        
        # TODO: refactor this with join()
        fullcountryarray = ''
        comma = ''
        shplccntarr.uniq.sort.each do |counryid|
          fullcountryarray = fullcountryarray + comma + counryid.to_s
          comma=','
        end

        # TODO: refactor this with 1-line
        shplece.countryarray = fullcountryarray
        shplece.save

        # if country array is blank - delete record
        if shplccntarr.blank? 
          current_user.placevidels.where('showplace_id'=>params[:id]).delete_all
        end

        redirect_to :back
      else
        current_user.placenets.where('showplace_id'=>params[:id]).delete_all
        @placevidel = Placevidel.new
        @placevidel.user = current_user
        @placevidel.showplace_id=params[:id]
        @placevidel.countryarray = Country.find(params[:country]).id.to_s
        fullcountryarray = ''
        comma = ''
        Showplace.find(params[:id]).countries.order('id ASC').each do |counryid|
          fullcountryarray = fullcountryarray + comma + counryid.id.to_s
          comma=','
        end
        @placevidel.fullcountryarray = fullcountryarray
        
        # TODO: WTF?
        if @placevidel.save
          redirect_to :back
        else
          redirect_to :back
        end

      end
    else
      session[:placevidels] =[] if session[:placevidels].nil?
      session[:placenets] =[] if session[:placenets].nil?
      session[:placevidelscountries] =[] if session[:placevidelscountries].nil?
      unless session[:placevidels].include?(params[:id])
        session[:placevidels] << params[:id]
        session[:placevidelscountries][params[:id].to_i] =[] if session[:placevidelscountries][params[:id].to_i].nil?
        session[:placevidelscountries][params[:id].to_i] << params[:country].to_i
        session[:placenets].delete(params[:id])
      else
        if session[:placevidelscountries][params[:id].to_i].include?(params[:country].to_i)
          session[:placevidelscountries][params[:id].to_i].delete(params[:country].to_i)
          if session[:placevidelscountries][params[:id].to_i].blank? 
            session[:placevidels].delete(params[:id])
          end
        else
          session[:placevidelscountries][params[:id].to_i] << params[:country].to_i
        end
      end
      redirect_to :back
    end
  end


  def noseen
    if current_user
      current_user.placevidels.where('showplace_id'=>params[:id]).delete_all
    else
      session[:placevidels].delete(params[:id])
      session[:placevidelscountries][params[:id].to_i] = []
    end
    redirect_to :back
  end


  def wish
    if current_user
      if @test = current_user.placedas.where('showplace_id'=>params[:id]).first
        flash[:danger] = "Exist"
        redirect_to :back
      else
        showplace = Showplace.find params[:id]
        current_user.placenets.where('showplace_id'=>params[:id]).delete_all
        @placeda = Placeda.new
        @placeda.user = current_user
        @placeda.showplace_id=params[:id]
        @placeda.countries = @placeda.country_ids
        if @placeda.save
          redirect_to :back
        else
          redirect_to :back
        end
      end
    else
      session[:placedas] =[] if session[:placedas].nil?
      session[:placenets] =[] if session[:placenets].nil?
      unless session[:placedas].include?(params[:id])
         session[:placedas] << params[:id]
         session[:placenets].delete(params[:id])
      end
      redirect_to :back
    end
  end

  def nowish
    if current_user
      current_user.placedas.where('showplace_id'=>params[:id]).delete_all
    else
      session[:placedas].delete(params[:id])
    end
    redirect_to :back
  end


  def no
    if current_user
      if @test = current_user.placenets.where('showplace_id'=>params[:id]).first
        flash[:danger] = "Exist"
        redirect_to :back
      else
        current_user.placedas.where('showplace_id'=>params[:id]).delete_all
        current_user.placevidels.where('showplace_id'=>params[:id]).delete_all
        @placenet = Placenet.new
        @placenet.user = current_user
        @placenet.showplace_id=params[:id]
        if @placenet.save
          redirect_to :back
        else
          redirect_to :back
        end
      end
    else
      session[:placevidels] =[] if session[:placevidels].nil?
      session[:placenets] =[] if session[:placenets].nil?
      session[:placedas] =[] if session[:placedas].nil?
      unless session[:placenets].include?(params[:id])
         session[:placenets] << params[:id]
         session[:placevidels].delete(params[:id])
         session[:placedas].delete(params[:id])
      end
      redirect_to :back
    end
  end

  def nono
    if current_user
      current_user.placenets.where('showplace_id'=>params[:id]).delete_all
    else
      session[:placenets].delete(params[:id])
    end
    redirect_to :back
  end


  def clickandgo
    @baner = Baner.find(params[:id])
    @baner.clickcount = 0 if @baner.clickcount.nil?
    @baner.clickcount = @baner.clickcount+1
    @baner.save
    redirect_to @baner.gourl.html_safe
  end
  
  def allnews
    @news = News.page(params[:page]).per(20)
  end

  def news
    @news = News.find_by_tag(params[:tag])
  end


end
