module Features
  module NodeScopers
    def within_row_with_text(text)
      within('tr', :text => text) do
        yield
      end
    end

    def within_control_group_with_label(label)
      within('div.control-group', :text => label) do
        yield
      end
    end

    def within_control_group_with_label_and_index(label, index)
      begin
        within(page.all('div.control-group', :text => label)[index]) do
          yield
        end
      rescue TypeError
        raise Capybara::ElementNotFound.new("Unable to find control group with label: #{label}")
      end
    end
  end
end
