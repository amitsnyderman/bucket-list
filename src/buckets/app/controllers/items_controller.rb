class ItemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create({
      # :user => current_user,
      :bucket => Bucket.find_or_create_by_code(params[:item][:bucket]),
      :text => params[:item][:text]
    })

    respond_to do |format|
      if @item.save
        current_user.items << @item
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to items_url }
        format.xml  { head :created, :location => item_url(@item) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors.to_xml }
      end
    end
  end
end
