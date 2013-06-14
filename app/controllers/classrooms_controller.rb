class ClassroomsController < ApplicationController

  def new
    
  end

  def show
    
  end

  def create
    # classroom = Classroom.create
    redirect_to classroom_path(1)
  end

end
