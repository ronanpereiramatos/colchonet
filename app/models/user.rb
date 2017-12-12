class User < ApplicationRecord
EMAIL_REGEXT = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

    validates_presence_of :email, :full_name, :location
    # validates_confirmation_of :password
    validates_length_of :bio, minimun: 30, allow_blank: false
    validate :email_format

    has_secure_password

    before_create do |user|
        user.confirmation_token = SecureRandom.urlsafe_base64
    end

    def confirm!
        return if confirmed?

        self.confirmed_at = Time.current
        self.confirmation_token = ''
        save!
    end

    def confirmed?
        confirmed_at.present?
    end

    private
    # Essa validação pode ser representada da seguinte forma:
    # validates_format_of :email, with: EMAIL_REGEXT
    # validate do errors.add(:email, :invalid) unless email.match(EMAIL_REGEXT)
    #validates :email, presence: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }, uniqueness: true
    def email_format
        errors.add(:email, :invalid) unless email.match(EMAIL_REGEXT)
    end

end
