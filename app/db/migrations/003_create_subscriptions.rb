# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:subscriptions) do
      uuid :id, primary_key: true
      foreign_key :subscriber_id, table: :subscribers
      foreign_key :tag_id, table: :tags

      String :title, null: false
      String :description, null: false
    end
  end
end