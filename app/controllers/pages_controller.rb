require 'net/http'
require 'uri'
require 'json'


class PagesController < ApplicationController
  def index
  end

  def signup
    uri = URI("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=#{Rails.application.credentials.firebase_api_key}")

    response = Net::HTTP.post_form(uri,"email": @email, "password": @password)
    data = JSON.parse(response.body)
    session[:user_id] = data["localId"]
    session[:data] = data

    redirect_to home_path, notice: "Signed up successfully" if response.is_a?(Net::HTTPSuccess)
    
  end

  def home
  end

  def login
  end
end
