class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ Burn::Regexes::VALID_EMAIL_ADDRESS
      record.errors[attribute] << (options[:message] || "is not a valid e-mail address")
    end
  end
end
