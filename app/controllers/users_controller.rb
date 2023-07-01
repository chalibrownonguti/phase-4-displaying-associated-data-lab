class UsersController < ApplicationController
    def show
          user = User.includes(:items).find(params[:id])
          render json: {
            id: user.id,
            username: user.username,
            city: user.city,
            items: user.items.map do |item|
                {
                    id: user.id,
                    name: item.name,
                    description: item.description,
                    price: item.price
                }
            end
          }
    end
end
