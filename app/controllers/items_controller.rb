class ItemsController < ApplicationController

	def index 
		if user_signed_in?
			@items = Item.where(:user_id => current_user.id).order("created_at DESC")
		end
	end

	def new  
		@item = current_user.items.build
	end

	def show
		@item = Item.find(params[:id])
	end

	def create 
		@item = current_user.items.build(item_params)

		if @item.save
			# An item only gets an id once its been saved to the database. Before that 
			# if we t ry to access an id member of item it doesn't exist. 
			redirect_to root_path # Redirects the the /post/show route. 
		else 
			render "new"
			puts "didn't save"
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
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to root_path
	end

	def item_params
		# find out what this does..
		params.require(:item).permit(:title, :description)
	end


end