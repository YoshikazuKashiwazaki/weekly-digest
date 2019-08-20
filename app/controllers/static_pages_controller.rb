class StaticPagesController < ApplicationController
	include ApplicationHelper
	def home
		@heading = "MyData Weekly Digests"
		@heading_short = "Weekly Digests"
		if params[:mode].to_s == ""
			@week = Weekly.where(status: 1)
			@user = User.where(status: 1)
			@app = App.where(status: 1)
		else
			@week = Weekly.all
			@user = User.all
			@app = App.all
		end

        case params[:view].to_s
        when "0"
        when "2"
            respond_to do |format|
                format.html { render layout: "application2", template: "static_pages/home2"}
            end
        else
            respond_to do |format|
                format.html { render layout: "application2", template: "static_pages/home2"}
            end
        end
	end

	def favicon
		send_file 'public/favicon.ico', type: 'image/x-icon', disposition: 'inline'
	end

end
