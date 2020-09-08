class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :upvotes

    validates :email, presence:true, uniqueness:true
    validates :username, presence:true, uniqueness:true

    extend Slugs::ClassMethods
    include Slugs::InstanceMethods
end
