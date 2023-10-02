class WeathersController < ApplicationController
  def show
    @weather = Hash.new

    @python_script = Rails.root.join('app', 'views', 'weathers', 'test.py')
    @output = `python3 #{@python_script}`.force_encoding('gbk')
    logger.tagged("WEATHER") { logger.debug "#{@weather}" }

    @weather[:weather] = @output
  end
end
