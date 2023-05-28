class User < ApplicationRecord
    has_secure_password

    ADMIN_ROLE = "admin".freeze
    USER_ROLE = "user".freeze

    ROLES = [ADMIN_ROLE, USER_ROLE].freeze

    validates :username, presence: true, uniqueness: true;
    validates :email, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { :in => ROLES }
end
