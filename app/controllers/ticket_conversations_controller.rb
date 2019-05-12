# - map/select отображает что-либо из данных
# - reject возвращает новый объект, убрает то что true по условию
# - group_by - группировка Ruby
# - sum - сумма
# - count - количество, может принимать функцию - в ней можно описать когд считать а когда нет
# - inject/reduce ну типа берешь начальный объект и над ним производишь накопление
# - 

# ORM ActiveRecord
# - maximum, minimum, average
# - where
# - limit
# - offset
# - order
# - group

# методы с восклицательным знаком сразу меняют объект
# типа reject! сразу изменит текущий объект
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
    # binding.pry
  end

  # POST /ticket_conversations
  # POST /ticket_conversations.json
  def create
    # @ticket_conversation = TicketConversation.new(ticket_conversation_params.merge(
    #   client_id: current_user.id # формируем диалог с текущим клиентом
    # ))
    ticket_params = ticket_conversation_params.merge(client_id: current_user.id)
    ticket_params[:messages_attributes].each { |k, v| ticket_params[:messages_attributes][k][:user_id] = current_user.id }

    @ticket_conversation = TicketConversation.new(ticket_params)
    # binding.pry
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

    # помечаем новые сообщения диалога текущим пользователем
    ticket_params[:messages_attributes].each { |k, v| ticket_params[:messages_attributes][k][:user_id] = current_user.id }
    
    # binding.pry
    respond_to do |format|
      if @ticket_conversation.update(ticket_params)
        format.html { redirect_to edit_ticket_conversation_path, notice: 'Ticket conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_conversation }
      else
        format.html { render :edit }
        format.json { render json: @ticket_conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  
    # binding.pry

    

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
    def set_ticket_conversation
      @ticket_conversation = TicketConversation.includes(messages: [:user]).order('messages.created_at ASC').find(params[:id])
    end

    def ticket_conversation_params
      
      # убираем пустые сообщения, и сообщения, уже имеющиеся в диалоге
      params[:ticket_conversation][:messages_attributes].reject! { |k, v| v[:value].blank? || v[:id].present? } if params.dig(:ticket_conversation, :messages_attributes).present?
      
     
      if current_user.manager?
        # разрешаем менять менеджера, статус, писать новые сообщение
        # тут отсекается все, кроме перечисленных полей
        params.require(:ticket_conversation).permit(:manager_id, :status, messages_attributes: [:value])
      else
        # разрешаем менять тему, писать новые сообщение
        # тут отсекается все, кроме перечисленных полей
        params.require(:ticket_conversation).permit(:subject, messages_attributes: [:value])
      end
    end
end
