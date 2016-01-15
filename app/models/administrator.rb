require 'digest/sha2'
class Administrator < ActiveRecord::Base
  validates_presence_of :username,message:"不能为空"
  validates_uniqueness_of :username,message:"已存在该管理员账户"
  validates_confirmation_of :password,message: "输入密码不一致"
  validates_length_of :password,minimum: 6,message: "至少要有6位"
  has_many :questions,:dependent => :destroy
  has_many :exams,:dependent => :destroy

  attr_accessor :password_confirmation
  attr_reader :password

  validate :password_must_be_present

  def self.auth(username,password)
    if administrator=find_by_username(username)
      if administrator.hashed_password == encrypt_password(password,administrator.salt)
        print administrator.hashed_password
        administrator
      end
    end
  end

  def self.encrypt_password(password,salt)

    Digest::SHA2.hexdigest(password.to_s+salt)
  end

  def password=(password)
    @password=password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end
  private

  def password_must_be_present
    errors.add(:password,"请输入密码") unless hashed_password.present?
  end

  def generate_salt
    self.salt=self.object_id.to_s + rand.to_s
  end
end
