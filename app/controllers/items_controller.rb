class ItemsController < ApplicationController

	def index 
		@items = Item.all.order("created_at DESC")
	end

	def new 
		# We create a new item that has nothing stored in it at first so the form 
		# can grab onto that item and then manipulate it.  
		@item = Item.new
	end

	def show
		@item = Item.find(params[:id])
	end

	def create 
		@item = Item.new(item_params)
	# 	private def post_params
	# 	params.require(:post).permit(:title, :body)
	# end
		if @item.save
			# An item only gets an id once its been saved to the database. Before that 
			# if we try to access an id member of item it doesn't exist. 
			redirect_to root_path # Redirects the the /post/show route. 
		else 
			render "new"
		end
	end

	def edit
		@item = Item.find(params[:id])	
	end

	def update 
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	def destroy

	end

	def item_params
		# find out what this does..
		params.require(:item).permit(:title, :description)
	end


end