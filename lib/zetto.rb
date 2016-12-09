require "zetto/engine"
require "zetto/config/params"

module Zetto

  def self.user_class
    @@user_class.constantize
  end

  def user_class
    @@user_class.constantize
  end

  def self.user_class=(user)
    Zetto::Config::Params.user_class = user
    @@user_class = user
  end

  def user_class=(user)
    Zetto::Config::Params.user_class = user
    @user_class = user
  end

end
