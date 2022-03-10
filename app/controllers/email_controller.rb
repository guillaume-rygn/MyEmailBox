class EmailController < ApplicationController

  def index

    @emails = Email.all

  end

  def create
  
    @email = Email.new(
      'object' => Faker::Book.title,
      'body' => Faker::Lorem.paragraph
    )

    @email.save
    

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end

  end

  def show
    @email = Email.find(params[:id])
    puts "$"*150
    @email.update(
      'read' => params[:status]
    )

    puts @email
    
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @emails = Email.all
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(
      'read' => !@email.read
    )
    puts "$"*150
    puts @email.read

  end


end
