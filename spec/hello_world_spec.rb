require "hello_world"

describe Hello_World do
  it "say hi" do
    expect(Hello_World.hello).to(eq("Hello, World!")) 
  end
end
