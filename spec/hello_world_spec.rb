require "hello_world"

describe Hello_World do

  context "say hi" do
    it { expect(Hello_World.hello).to(eq("Hello, World!")) }
  end
end
