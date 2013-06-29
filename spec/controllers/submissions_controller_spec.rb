require 'spec_helper'

describe SubmissionsController do 
  let(:student){create_student}

  before do
    controller.stub(:current_user).and_return(student)
  end

  describe "#create" do 
    context "given valid params" do 
      it "creates a new submission" do 
        post :create, answer_id: 1, format: :json
        submission = JSON.parse(response.body).with_indifferent_access
        expect(submission[:id]).to be
        expect(submission[:student_id]).to eq(student.id)
        expect(submission[:answer_id]).to eq(1)
        expect(submission.size).to eq(3)
      end
    end
  end
end
