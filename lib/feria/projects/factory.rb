module Feria
  module Projects
    class Factory
      def initialize(opts = {})
        @opts = opts
      end

      def build
        project.add_participants(@opts[:participants_attributes])
        project
      end

      private
      def project
        @project ||= Project.new(
          name: @opts[:name],
          category_id: @opts[:category_id],
          motivation: @opts[:motivation],
          description: @opts[:description],
          advantage: @opts[:advantage],
          phase: 1
        )
      end
    end
  end
end

