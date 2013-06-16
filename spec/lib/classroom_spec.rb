require 'spec_helper'

describe Classroom do

  describe ".create" do
    context "valid input" do
      it "creates a Classroom" do
        VCR.use_cassette('classroom create') do
          classroom = Classroom.create(1, "bro blair 102")

          expect(classroom.name).to eq("bro blair 102")
          expect(classroom.teacher_id).to eq(1)
          expect(classroom.id).to_not be_nil
        end
      end
    end

    context "no name inluded" do
      it "returns nil" do
        VCR.use_cassette('classroom create with no name') do
          classroom = Classroom.create(1, "")

          expect(classroom).to eq(nil)
        end
      end
    end
  end

end
