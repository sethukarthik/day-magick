require "day/magick/version"

module DayMagick
 	def day_magick
 		current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    case
    when midnight.upto(noon).include?(current_time)
      greeting = "Morning"
    when noon.upto(five_pm).include?(current_time)
      greeting =  "Afternoon"
    when five_pm.upto(eight_pm).include?(current_time)
      greeting = "Evening"
    when eight_pm.upto(midnight + 1.day).include?(current_time)
      greeting = "Night"
    end
    return greeting
	end
end

ActionView::Base.send(:include, DayMagick) if defined?(ActionView::Base)