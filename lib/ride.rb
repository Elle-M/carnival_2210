class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log,
              :total_revenue

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = {}
    @total_revenue = 0
  end

  def board_rider(visitor)
    @rider_log + visitor
  end

  def spending_money
    @total_revenue = @spending_money - @admission_fee
  end
end
