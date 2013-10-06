class Burner < ActiveRecord::Base
  validates :slug,
            :uniqueness => true,
            :presence   => true
  validates :user, :presence => true

  belongs_to :email_address
  belongs_to :user

  before_validation :set_unique_slug

  # ToDo: Verify user ownership of email_address

  def inbound_address
    [slug, inbound_host].join('@')
  end

  private

  def inbound_host
    'i.burnem.com'
  end

  def new_slug
    o = [('a'..'z'), (0..9)].map { |i| i.to_a }.flatten
    string = (10...20).map{ o[rand(o.length)] }.join
  end

  def set_unique_slug
    begin
      self.slug = new_slug
    end while self.class.where(:slug => slug).exists?
  end
end
