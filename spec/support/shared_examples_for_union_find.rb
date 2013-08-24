shared_examples "a union-find" do
  subject { described_class.new(10) }

  describe '#initialize' do
    it 'accepts a integer for the number of sites' do
      expect { subject }.not_to raise_error
    end
  end

  describe '#connected?' do
    it 'has no connected sites on initialization' do
      subject.connected?(0,1).should be_false
      subject.connected?(3,5).should be_false
    end
  end

  describe '#union' do
    it 'connects 2 sites' do
      subject.union(0,1)
      subject.connected?(0,1).should be_true
    end

    #      +-+   +-+   +-+   +-+   +-+
    #      |0|   |1+---|2|   |3|---|4|
    #      +++   +-+   +++   +-+   +-+
    #       |           |     |     |
    #       |           |     |     |
    #      +-+   +-+   +-+   +-+   +-+
    #      |5+---|6|   |7|   |8|   |9|
    #      +-+   +-+   +-+   +-+   +-+
    it 'connects mulitple sites' do
      subject.union(5,6)
      subject.union(5,0)
      subject.union(2,7)
      subject.union(2,1)
      subject.union(4,9)
      subject.union(3,8)
      subject.union(9,3)

      subject.connected?(0,5).should be_true
      subject.connected?(0,6).should be_true
      subject.connected?(1,7).should be_true
      subject.connected?(8,9).should be_true

      subject.connected?(1,0).should be_false
      subject.connected?(1,6).should be_false
      subject.connected?(0,9).should be_false
    end
  end
end


