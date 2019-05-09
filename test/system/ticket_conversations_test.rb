require "application_system_test_case"

class TicketConversationsTest < ApplicationSystemTestCase
  setup do
    @ticket_conversation = ticket_conversations(:one)
  end

  test "visiting the index" do
    visit ticket_conversations_url
    assert_selector "h1", text: "Ticket Conversations"
  end

  test "creating a Ticket conversation" do
    visit ticket_conversations_url
    click_on "New Ticket Conversation"

    fill_in "Client", with: @ticket_conversation.client_id
    fill_in "Manager", with: @ticket_conversation.manager_id
    fill_in "Status", with: @ticket_conversation.status
    fill_in "Subject", with: @ticket_conversation.subject
    click_on "Create Ticket conversation"

    assert_text "Ticket conversation was successfully created"
    click_on "Back"
  end

  test "updating a Ticket conversation" do
    visit ticket_conversations_url
    click_on "Edit", match: :first

    fill_in "Client", with: @ticket_conversation.client_id
    fill_in "Manager", with: @ticket_conversation.manager_id
    fill_in "Status", with: @ticket_conversation.status
    fill_in "Subject", with: @ticket_conversation.subject
    click_on "Update Ticket conversation"

    assert_text "Ticket conversation was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket conversation" do
    visit ticket_conversations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket conversation was successfully destroyed"
  end
end
