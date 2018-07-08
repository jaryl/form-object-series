class UserRegistrationForm

  include ActiveModel::Model

  attr_accessor :terms_of_service
  attr_reader :person

  delegate :attributes=, to: :person, prefix: true

  validates :terms_of_service, acceptance: true
  validate :person_is_valid

  def initialize(params= {})
    @person = Person.new
    super(params)
    @terms_of_service ||= false
  end

  def submit
    return false if invalid?
    person.save
  end

  private

  def person_is_valid
    errors.add(:person, 'is invalid') if person.invalid?
  end

end
