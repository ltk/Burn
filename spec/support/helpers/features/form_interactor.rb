module Features
  module FormInteractor
    def fill_in_form_field(name, value, index = 0)
      within_control_group_with_label_and_index(name, index) do
        if value.is_a? Hash
          if value[:select].present?
            fill_in_select_form_field(name, value[:select])

          elsif value[:radio].present?
            fill_in_radio_form_field(value[:radio])

          elsif value[:polymorphic_select].present?
            fill_in_polymorphic_select_form_field(name, value[:polymorphic_select])

          elsif value[:file].present?
            fill_in_file_form_field(name, value[:file])

          elsif value[:datetime].present?
            fill_in_datetime_form_field(name, value[:datetime])

          elsif value[:checkbox].present?
            fill_in_checkbox_form_field(name, value[:checkbox])
          end
        else
          fill_in name, :with => value
        end
      end
    end

    def fill_in_select_form_field(name, value)
      select value, :from => name
    end

    def fill_in_radio_form_field(value)
      choose value
    end

    def fill_in_polymorphic_select_form_field(name, options)
      select options[:value], :from => name

      find("input#{options[:hidden]}").set(options[:type])
    end

    def fill_in_file_form_field(name, value)
      attach_file(name, value)
    end

    def fill_in_checkbox_form_field(name, value)
      if value == :checked
        find_field(name).set(true)
      elsif value == :unchecked
        find_field(name).set(false)
      end
    end

    def value_for_form_field(fields, field)
      value = fields[field]

      if value.is_a? Hash
        value = if value[:select].present?
                  value[:select]
                elsif value[:polymorphic_select].present?
                  value[:polymorphic_select][:value]
                end
      end

      value
    end

    def form_field_value(field, index = 0)
      within_control_group_with_label_and_index(field, index) do
        find_field(field).value
      end
    end
  end
end
