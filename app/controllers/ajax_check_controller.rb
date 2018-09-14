class AjaxCheckController < ApplicationController
  def check
    count = params[:imageCount].to_i
    count2 = params[:buttonReject].to_i
    print "XXXXXXXXXXXXX #{count} XXXXXXXXXXXXXXX \n"
    path = Rails.root.join("public/*.jpg")

    #count_jpgs = Dir[path].count.to_i
    count_jpgs = Image.all.count.to_i
    count_rejects = Image.where.not(finished: nil).count.to_i

    print count_jpgs

    @reload = {}

    #@reload[:reload] = (count != count_jpgs) || count2 != count_rejects
    if count != count_jpgs
      @reload[:do_reload] = true
      print "Problem is in files \n"
    elsif count2 > count_rejects
      @reload[:do_reload] = true
      print "Problem is in rejects"
    else
      @reload[:do_reload] = false
      print "There is no problem!"
    end

    print "YYYYYYYYYYYYYYYYYYYYYY #{count2} YYYYYYYYYYYYYY"
    print "ZZZZZZZZZZZZZZZZZZZZ #{count_rejects} ZZZZZZZZZZZ"
    print @reload[:do_reload]

    render json: @reload.to_json
  end
end
