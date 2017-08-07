# frozen_string_literal: true

module ActiveRecord
  module Associations
    class Preloader
      class SingularAssociation < Association #:nodoc:
        private

          def preload(preloader, skip_setting_association = false)
            if skip_setting_association
              associated_records_by_owner(preloader)
            else
              associated_records_by_owner(preloader).each do |owner, associated_records|
                record = associated_records.first

                association = owner.association(reflection.name)
                association.target = record
              end
            end
          end
      end
    end
  end
end
