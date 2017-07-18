require_relative "./composite"

describe "Number is composite?" do
  it "3  is not composite number" do
    result = composite(3)
    expect(result).to eq(false)
  end

  it "10 is composite number" do
    result = composite(10)
    expect(result).to eq(true)
  end

end
