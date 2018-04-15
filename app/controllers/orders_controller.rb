class OrdersController < ApplicationController
  def new
    @screening = Screening.find(params[:screening_id])
    @order = Order.new(screening: @screening)
    @order.build_customer
  end

  def create
    screening = Screening.find(order_params["screening_id"])
    @order = Order.new(order_params)
    @order.screening = screening

    if @order.save
      # send Mailer
      # msg on modal
    else
    # send Mailer in case of error or success
     # msg on modal
    end
  end

  private
  def order_params
    params.require(:order).permit(:total_cost, :seat_count, :screening_id,
      customer_attributes: [:id, :last_name, :first_name, :email])
      # screening_attributes: [:id, :scheduled_at, :movie_id, :theater_id],
  end
end
