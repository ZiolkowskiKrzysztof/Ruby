require "linked_list"

describe Deque do

  describe ".push" do

    it "pop" do
      deque = Deque.new
      deque.push(10)
      deque.push(20)
      expect(deque.pop).to(eq(20))
      expect(deque.pop).to(eq(10))
    end

    it "shift" do
      deque = Deque.new
      deque.push(10)
      deque.push(20)
      expect(deque.shift).to(eq(10))
      expect(deque.shift).to(eq(20))
    end

  end

  describe ".unshift" do

    it "shift" do
      deque = Deque.new
      deque.unshift(10)
      deque.unshift(20)
      expect(deque.shift).to(eq(20))
      expect(deque.shift).to(eq(10))
    end

    it "pop" do
      deque = Deque.new
      deque.unshift(10)
      deque.unshift(20)
      expect(deque.pop).to(eq(10))
      expect(deque.pop).to(eq(20))
    end

  end

  context "assert" do

    context "example" do
      deque = Deque.new
      it { 
        deque.push(10)
        deque.push(20)
        expect(deque.pop).to(eq(20))
      }
      it {
        deque.push(30)
        expect(deque.shift).to(eq(10))
      }
      it { 
        deque.unshift(40)
        deque.push(50)
        expect(deque.shift).to(eq(40))
      }
      it { expect(deque.pop).to(eq(50)) }
      it { expect(deque.shift).to(eq(30)) }
    end

    context "pop to empty" do
      deque = Deque.new
      it {
        deque.push(10)
        expect(deque.pop).to(eq(10))
      }
      it { deque.push(20)
      expect(deque.shift).to(eq(20)) }
    end

    it "shift to empty" do
      deque = Deque.new
      deque.unshift(10)
      expect(deque.shift).to(eq(10))
      deque.unshift(20)
      expect(deque.pop).to(eq(20))
    end
  end
end
