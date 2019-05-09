require 'test_helper'

class TicketConversationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_conversation = ticket_conversations(:one)
  end

  test "should get index" do
    get ticket_conversations_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_conversation_url
    assert_response :success
  end

  test "should create ticket_conversation" do
    assert_difference('TicketConversation.count') do
      post ticket_conversations_url, params: { ticket_conversation: { client_id: @ticket_conversation.client_id, manager_id: @ticket_conversation.manager_id, status: @ticket_conversation.status, subject: @ticket_conversation.subject } }
    end

    assert_redirected_to ticket_conversation_url(TicketConversation.last)
  end

  test "should show ticket_conversation" do
    get ticket_conversation_url(@ticket_conversation)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_conversation_url(@ticket_conversation)
    assert_response :success
  end

  test "should update ticket_conversation" do
    patch ticket_conversation_url(@ticket_conversation), params: { ticket_conversation: { client_id: @ticket_conversation.client_id, manager_id: @ticket_conversation.manager_id, status: @ticket_conversation.status, subject: @ticket_conversation.subject } }
    assert_redirected_to ticket_conversation_url(@ticket_conversation)
  end

  test "should destroy ticket_conversation" do
    assert_difference('TicketConversation.count', -1) do
      delete ticket_conversation_url(@ticket_conversation)
    end

    assert_redirected_to ticket_conversations_url
  end
end
