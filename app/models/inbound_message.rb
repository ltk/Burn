class InboundMessage < ActiveRecord::Base
  validates :raw,
            :headers,
            :from_email,
            :to,
            :email,
            :subject,
            :spam_score,
            :spf_result,
            :dkim_valid,
            :burner,
            :presence => true

  belongs_to :burner


  def self.from_mandrill_event(e)
    new :raw        => e[:msg][:raw_msg],
        :headers    => e[:msg][:headers],
        :text       => e[:msg][:text],
        :html       => e[:msg][:html],
        :from_email => e[:msg][:from_email],
        :from_name  => e[:msg][:from_name],
        :to         => e[:msg][:to],
        :email      => e[:msg][:email],
        :subject    => e[:msg][:subject],
        :spam_score => e[:msg][:spam_report][:score],
        :spf_result => e[:msg][:spf][:result],
        :dkim_valid => e[:msg][:dkim][:valid],
        :burner     => Burner.find_by_slug(slug_from_email_address(e[:msg][:email]))
  end

  def self.slug_from_email_address(address)
    address.split('@')[0].chomp('-in')
  end
end
