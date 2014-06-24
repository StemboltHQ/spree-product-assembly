module Spree
  class AssembliesPart < ActiveRecord::Base
    belongs_to :assembly, :class_name => "Spree::Product", :foreign_key => "assembly_id"
    belongs_to :part, :class_name => "Spree::Variant", :foreign_key => "part_id"

    def self.get(assembly_id, part_id)
      find_or_initialize_by(assembly_id: assembly_id, part_id: part_id)
    end

    def count_on_hand
      part.total_on_hand / count
    end
  end
end
