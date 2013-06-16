require 'spec_helper'

describe ClassroomsController do

  describe '#create' do

    context "given valid parameters" do

      it "sends JSON to classroom service" do
        classroom = Classroom.create(1, "English 101")
        controller.stub_chain(:current_user, :id).and_return(1)
        Classroom.stub(:create).with(1, "English 101").and_return(classroom)

        post :create, class_name: "English 101"
        expect(assigns(:classroom)).to eq classroom

      end
    end

    context "given invalid parameters" do

      it "sends JSON without a classroom name to classroom service" do
        controller.stub_chain(:current_user, :id).and_return(1)
        Classroom.stub(:create).with(1, "")

        post :create, class_name: ""
        expect(assigns(:classroom)).to eq nil

      end
    end
  end

end