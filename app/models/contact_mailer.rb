class ContactMailer < ActionMailer::Base

  def message(contact)
    # Message headers
    recipients    "everyone@mamadoll.tv"
    sent_on       Time.now
    from          "\"#{contact[:name]}\" <#{contact[:email]}>"
    subject       "Message from mamadoll.tv"
    
    # Message body
    body          :message => contact[:message]
  end

end
