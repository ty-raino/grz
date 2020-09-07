class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    has_many :upvotes

    validates :email, presence:true, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/ }, uniqueness:true
    validates :name, presence:true, length:{within:6..32} , format: {with: /\A[a-z0-9_]{4,16}\z/, message:"can contain alphabets, numbers and underscores only"}
    validates :password, presence:true, length:{within:8..32}, confirmation:true

    extend Slugs::ClassMethods
    include Slugs::InstanceMethods
end
