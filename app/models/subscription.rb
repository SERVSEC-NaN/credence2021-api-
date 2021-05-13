# frozen_string_literal: true

require 'json'
require 'sequel'

module Rewards
  # Models a subscription
  class Subscription < Sequel::Model
    many_to_one :promoters, left_key: :subscription_id, right_key: :promoter_id,
                            join_table: :subscriptions_promoters

    many_to_many :subscribers, left_key: :subscriber_id, right_key: :subscription_id,
                               join_table: :subscriptions_subscribers

    many_to_many :tags, left_key: :subscription_id, right_key: :tag_id,
                        join_table: :subscriptions_tags

    plugin :uuid, field: :id
    plugin :json_serializer
    plugin :validation_helpers
    plugin :whitelist_security

    set_allowed_columns :title, :description

    def validate
      super
      validates_presence %i[title description]
    end
  end
end
