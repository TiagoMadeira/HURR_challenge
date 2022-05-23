require 'timeout'
class HomeController < ApplicationController
  def index
    #If user not signed in redirect to login page
    if not user_signed_in?
      redirect_to new_user_session_path
    else
      @user_blocked_dates = current_user.blocked_dates.pluck(:begin_at, :end_at).to_json.html_safe
    end
  end

  def add_blocked_dates_to_user
    
    
    begin_str, end_str = permit_date_picker_params[:datepicker].split(' - ')
    begin_at = Date.parse(begin_str)
    end_at = Date.parse(end_str)
    current_user.blocked_dates.create(begin_at: begin_at, end_at: end_at)
    
    uri = URI('http://localhost:3001/api/v1/users/add_blocked_dates_to_user')

    begin
      res = Net::HTTP.post_form(uri, 'email' => current_user.email, 'begin_at' => begin_at,'end_at' => end_at)
      puts res.body  if res.is_a?(Net::HTTPSuccess)
    rescue Timeout::Error => exc
      puts "ERROR: #{exc.message}"
    end
    redirect_to home_index_path
  end

  private

  def permit_date_picker_params
    params.require('datepicker')
    params.permit('datepicker')
    
  end

end
