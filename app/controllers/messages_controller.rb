class MessagesController < ApplicationController

  before_filter :authenticate_user!
  # TODO users can see other users' messages

  def index
    @messages = current_user.messages_in.order('created_at DESC').group('sender_id')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def with
    @other = User.find(params[:id])
    @messages = Message.where("(sender_id is #{current_user.id} AND recipient_id is #{@other.id}) OR (sender_id is #{@other.id} AND recipient_id is #{current_user.id})").order('created_at')
    @messages.each do |m|
      m.mark_read
    end
    @new_message = Message.new
    # @message.update_attribute :read => Time.now
    respond_to do |format|
      format.html # with.html.erb
      format.json { render json: @message }
    end
  end

  def new
    @message = Message.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def create
    recipient = User.find_by_name params[:message][:recipient]
    @message = Message.new(params[:message].merge({ :recipient => recipient }))
    @message.sender = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to "/messages/#{recipient.id}/with" }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def read
    Message.find(params[:id]).mark_read
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :no_content }
    end
  end

end
