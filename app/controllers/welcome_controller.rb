class WelcomeController < ApplicationController
  def index
    #TODO: get random public not nil Collection
    @cds = nil
    @collection_name = "Une superbe collection !"

    sort = params[:sort]
    if sort.nil? || sort == ''
      @cds = Cd.all.order('created_at DESC')
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
          @cds = Cd.all.order('created_at DESC')
      end
    end

    render 'index'
  end
end