require_relative "./total_price"

describe "cake total price" do
  it "1 cake total price is 30" do
    result = total_price(1)
    expect(result).to eq(30)
  end

  it "2 cake total price is 45" do
    result = total_price(2)
    expect(result).to eq(45)
  end

  it "3 cake total price is 75" do
    result = total_price(3)
    expect(result).to eq(75)
  end

  it "4 cake total price is 90" do
    result = total_price(4)
    expect(result).to eq(90)
  end

end
