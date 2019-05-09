class TicketConversationsController < ApplicationController
  before_action :set_ticket_conversation, only: [:show, :edit, :update, :destroy]

  # GET /ticket_conversations
  # GET /ticket_conversations.json
  def index
    @ticket_conversations = TicketConversation.all
  end

  # GET /ticket_conversations/1
  # GET /ticket_conversations/1.json
  def show
  end

  # GET /ticket_conversations/new
  def new
    @ticket_conversation = TicketConversation.new
    @ticket_conversation.messages.build
  end
 
  # GET /ticket_conversations/1/edit
  def edit
    @ticket_conversation.messages.build
  end

  # POST /ticket_conversations
  # POST /ticket_conversations.json
  def create
    ticket_params = ticket_conversation_params.merge(client_id: current_user.id)
    ticket_params[:messages_attributes].each { |k, v| ticket_params[:messages_attributes][k][:user_id] = current_user.id }

    @ticket_conversation = TicketConversation.new(ticket_params)

    respond_to do |format|
      if @ticket_conversation.save
        format.html { redirect_to @ticket_conversation, notice: 'Ticket conversation was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_conversation }
      else
        format.html { render :new }
        format.json { render json: @ticket_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_conversations/1
  # PATCH/PUT /ticket_conversations/1.json
  def update
    ticket_params = ticket_conversation_params
    ticket_params[:messages_attributes].each { |k, v| ticket_params[:messages_attributes][k][:user_id] = current_user.id }

    respond_to do |format|
      if @ticket_conversation.update(ticket_params)        
        format.html { redirect_to @ticket_conversation, notice: 'Ticket conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_conversation }
      else
        format.html { render :edit }
        format.json { render json: @ticket_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_conversations/1
  # DELETE /ticket_conversations/1.json
  def destroy
    @ticket_conversation.destroy
    respond_to do |format|
      format.html { redirect_to ticket_conversations_url, notice: 'Ticket conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_conversation
      @ticket_conversation = TicketConversation.includes(:messages).order('messages.created_at ASC').find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_conversation_params
      if current_user.manager?
        params.require(:ticket_conversation).permit(:subject, :manager_id, :status, messages_attributes: [:value, :id])
      else
        params.require(:ticket_conversation).permit(:subject, messages_attributes: [:value, :id])
      end
    end
end
