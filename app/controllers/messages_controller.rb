class MessagesController < ApplicationController

  before_filter :authenticate_user!
  # TODO users can see other users' messages

  def index
    @messages = current_user.messages_in.order('created_at ASC').group('sender_id')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def with
    @other = User.find(params[:other_id])
    @messages = current_user.messages.with(@other.id)
    @new_message = current_user.messages_out.build
    respond_to do |format|
      format.html # with.html.erb
      format.json { render json: @message }
    end
  end

  def new
    @message = current_user.messages_out.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def create
    recipient = User.find_by_name params[:message][:recipient]
    @message = Message.new(params[:message].merge({ :recipient => recipient }))
    @message.sender = current_user # TODO does this belong here?
    respond_to do |format|
      if @message.save
        format.html { redirect_to with_messages_path(:other_id => recipient.id) }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def read
    current_user.messages.find(params[:id]).mark_read!
    respond_to do |format|
      format.html { redirect_to messages_path }
      format.json { head :no_content }
    end
  end

end
