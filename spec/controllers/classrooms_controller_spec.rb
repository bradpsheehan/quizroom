require 'spec_helper'

describe ClassroomsController do

  describe '#create' do

    context "given valid parameters" do

      it "sends JSON to classroom service" do

        VCR.use_cassette("create a classroom") do
          controller.stub_chain(:current_user, :teacher).and_return(true)
          controller.stub_chain(:current_user, :id).and_return(14)

          post :create, class_name: "Blair is a bro 101"
          classroom = assigns(:classroom)
          expect(classroom.name ).to eq "Blair is a bro 101"
          expect(classroom.teacher_id ).to eq 14
        end
      end
    end

    context "given invalid parameters" do

      it "sends JSON without a classroom name to classroom service" do
        controller.stub_chain(:current_user, :id).and_return(1)
        controller.stub_chain(:current_user, :teacher).and_return(true)

        post :create, class_name: ""
        expect(assigns(:classroom)).to eq nil

      end
    end
  end

  describe "#show"


end