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

  describe ".add_students" do
    let(:classroom){Classroom.create(1, "Refactoring 202")}

    context "with non-existing students" do
      it "adds the students to the classroom" do
        Classroom.add_students(classroom.id, [1, 2, 3])
        expect(classroom.student_ids).to eq([1, 2, 3])
      end
    end
  end
end
