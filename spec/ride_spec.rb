require './lib/ride'
require './lib/ride'

RSpec.describe Ride do
  describe '#initialize' do
    it 'has a attributes' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  xit 'has preferences' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    expect(visitor1.add_preference).to eq([:gentle])
    expect(visitor2.add_preference).to eq([:gentle])
  end

  xit 'tracks who has ridden and how many times' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    
    expect(ride1.rider_log).to eq(visitor1, visitor2)
  end

  xit 'does not board if they are not tall enough or do not have a matching preference' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)

    expect(visitor1.add_preference).to eq([:gentle])
    expect(visitor2.add_preference).to eq([:gentle, :thrilling])
    expect(visitor2.add_preference).to eq([:thrilling])

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    
    ride3.board_rider(visitor1)
    ride3.board_rider(visitor2)
    ride3.board_rider(visitor3)

    expect(ride3.rider_log).to eq(visitor3)
    expect(ride3.total_revenue).to eq(3)
  end
end



  

