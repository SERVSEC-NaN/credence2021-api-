# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:subscriptions) do
      primary_key :id
      foreign_key :promoter_id, table: :promoters,
                                type: 'char(36)' # UUID
      String :title, null: false
      String :description, null: false
    end
  end
end
