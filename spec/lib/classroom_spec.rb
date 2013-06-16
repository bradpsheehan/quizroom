require 'spec_helper'

describe Classroom do

  describe ".create" do
    context "valid input" do
      it "creates a Classroom" do
        VCR.use_cassette('classroom create') do
          classroom = Classroom.create(1, "bro blair 101")

          expect(classroom.name).to eq("bro blair 101")
          expect(classroom.teacher_id).to eq(1)
          expect(classroom.id).to_not be_nil
        end
      end
    end

    context "invalid input" do
      it "returns nil"
    end
  end

end
