class UserInvitationForm

  include ActiveModel::Model

  attr_accessor :invitations

  validate :at_least_one_invitation, :invitations_are_valid

  def initialize(params = {})
    super(params)
    @invitations ||= [Invitation.new]
  end

  def invitations_attributes=(values)
    @invitations = values.map { |_key, params| Invitation.new(params) }
  end

  def submit
    return false if invalid?
    @invitations.each do |invitation|
      # deliver invitation mailer
    end
    true
  end

  private

  def at_least_one_invitation
    errors.add(:invitations, 'are blank') if invitations.empty?
  end

  def invitations_are_valid
    errors.add(:invitations, 'are invalid') if invitations.any?(&:invalid?)
  end

end
