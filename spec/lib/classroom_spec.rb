require 'spec_helper'

describe Classroom do

  describe ".create" do
    context "valid input" do
      it "creates a Classroom" do
        classroom = Classroom.create(1, "bro 101")

        expect(classroom.name).to eq("bro 101")
        expect(classroom.teacher_id).to eq(1)
        expect(classroom.id).to_not be_nil
      end
    end

    context "invalid input" do
      it "returns nil"
    end
  end

end
