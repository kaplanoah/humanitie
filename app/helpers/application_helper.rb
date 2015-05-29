module ApplicationHelper

  def send_image_text_alert(recipient_phone, image_url)
    @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

    @twilio_client.account.messages.create(
      :from => "+1#{ENV['TWILIO_PHONE']}",
      :to   => recipient_phone,
      :body => "We took your picture in space! Go to humanitiesatellite.com/profile to check it out.",
      :mediaUrl => image_url,
    )
  end

end
