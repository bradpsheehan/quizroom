require 'spec_helper'

describe ClassroomsController do

  describe '#create' do

    before do
      controller.stub(:require_login)
      controller.stub(:is_teacher)
      controller.stub_chain(:current_user, :id).and_return(1)
    end

    context "given valid parameters" do

      it "sends JSON to classroom service" do

        classroom = Classroom.new

        Classroom.should_receive(:create)
          .with(teacher_id: 1, name: "English")
          .and_return(classroom)

        post :create, class_name: "English"
        expect(assigns(:classroom)).to eq classroom
      end
    end

    context "given invalid parameters" do

      it "sends JSON without a classroom name to classroom service" do
        Classroom.should_receive(:create).with(teacher_id: 1, name: nil).and_return(nil)
        post :create
        expect(response).to redirect_to(new_classroom_path)

      end
    end
  end

  describe "#show"


end