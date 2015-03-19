class WelcomeController < ApplicationController
  def index
    @cds =nil

    sort = params[:sort]
    if sort.nil? || sort == ''
      @cds = Cd.all
    else
      case sort
        when 'date'
          @cds = Cd.all.order('created_at')
        when 'dateDesc'
          @cds = Cd.all.order('created_at DESC')
        when 'name'
          @cds = Cd.all.order('name')
        when 'nameDesc'
          @cds = Cd.all.order('name DESC')

        when 'purchaseDate'
          @cds = Cd.all.order('purchaseDate')
        when 'purchaseDateDesc'
          @cds = Cd.all.order('purchaseDate DESC')
        else
          @cds = Cd.all
      end
    end

    render 'index'
  end
end