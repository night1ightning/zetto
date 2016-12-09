module Zetto
  module Models

    class Session < ActiveRecord::Base
      belongs_to :user, class_name: Zetto::Config::Params.user_class.to_s, :foreign_key => 'user_id'

      validates :user_id, numericality: { only_integer: true }, presence: true, uniqueness: { case_sensitive: false }
      validates :session_id, presence: true, length: { is: 9 }, uniqueness: { case_sensitive: false }
      validates :algorithm, presence: true

    end
  end


end