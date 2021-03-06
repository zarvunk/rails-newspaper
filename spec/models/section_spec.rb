require 'spec_helper'

describe Section do

  subject { Section.first } # FactoryGirl.build(:section)

  describe "instance methods" do

    it { should respond_to :name }
    it { should respond_to :writer }
    
    describe "#writer method" do
      specify { subject.writer.should be_a_kind_of Writer }
    end

  end

  describe "validations" do

    context "when the name is blank" do
      before { subject.name = " " }
      it { should_not be_valid }
    end

    context "when the name is the same as another's" do
      it "should not be valid" do
        copycat = Section.new(name: subject.name)
        copycat.should_not be_valid
      end
    end

  end

end
