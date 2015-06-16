class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Try again."
      render :edit
    end
  end

  def destroy 
    @topic = Topic.find(params[:id])
    
    if @topic.destroy
      flash[:notice] = "Successfully deleted."
      redirect_to topics_path
    else
      flash[:error] = "There was no error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:email, :name, :description, :public)
  end
end
