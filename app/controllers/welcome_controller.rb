class WelcomeController < ApplicationController
  def index
    #TODO: get random public not nil Collection
    @collection_item = ItemCollection.get_last_public_collection

    unless @collection_item.nil?
      @collection_owner_pseudo=User.find(@collection_item.user_id).pseudo
      @collection_name=@collection_item.name
      @cds=Cd.where("item_collection_id = ?", @collection_item.id)
      sort = params[:sort]
      if sort.nil? || sort == ''
        @cds = @cds.order('created_at DESC')
      else
        case sort
          when 'date'
            @cds = @cds.order('created_at')
          when 'dateDesc'
            @cds = @cds.order('created_at DESC')
          when 'name'
            @cds = @cds.order('name')
          when 'nameDesc'
            @cds = @cds.order('name DESC')

          when 'purchaseDate'
            @cds = @cds.order('purchaseDate')
          when 'purchaseDateDesc'
            @cds = @cds.order('purchaseDate DESC')
          else
            @cds = @cds.order('created_at DESC')
        end
      end
    end

    render 'index'
  end
end