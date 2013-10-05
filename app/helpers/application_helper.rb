module ApplicationHelper
  def display_alert(message, type = nil)
    if message.present?
      classes = ['alert']
      classes << "alert-#{type}" if type.present?

      content_tag(:div, :class => classes) do
        concat(message)
      end
    end
  end

  def display_flash_alert
    alert_type_mapping = {
      :notice => 'success',
      :error  => 'error',
      :alert  => 'error'
    }
    message_key        = flash.keys.detect {|k| alert_type_mapping.keys.include?(k) }

    if message_key
      display_alert(flash[message_key], alert_type_mapping[message_key])
    end
  end
end
