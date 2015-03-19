class WelcomeController < ApplicationController
  def index
    @cds = Cd.all
    render 'index'
  end
end