require "rspec"
require "./lib/person.rb"

describe "Person initialization" do

  it "should initialize it's fields from a hash" do
    argument_hash =   {:name => "Dagobert", :hobbies => "Money"}
    p = Person.new(argument_hash)
    expect(p.name).to eq "Dagobert"
    expect(p.hobbies).to eq ["Money"]

  end

  it "should raise an UnknownAttributeError if a field is unknown" do
    argument_hash =   {:name => "Dagobert", :hobbies => "Money",:nonexistentfield => "some Value"}
    expect { p = Person.new(argument_hash) }.to raise_error(UnknownAttributeError)
  end

  it "should still be initializable without any parameters" do
    p = Person.new
  end

  it "should work with an arbitrary attribute" do
    random_field_name = (0...5).map { (97 + rand(26)).chr }.join
    RFN = random_field_name.to_sym
    class Person
      attr_accessor RFN
    end
    random_field_value = "The Value of the Random Field"
    argument_hash =   {:name => "Dagobert", :hobbies => "Money",random_field_name.to_sym => random_field_value}
    p = Person.new(argument_hash)
    expect(p.send(random_field_name)).to eq random_field_value
  end

end
