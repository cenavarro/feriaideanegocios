module Feria
  module Ratings
    class Calculator
      attr_reader :project

      def initialize(project)
        @project = project
      end

      def total_rating
        (averages.inject(:+) / averages.count).round(2) rescue 0
      end

      private
      def ratings
        @ratings ||= project.ratings.in_phase(project.phase)
      end

      def averages
        @averages ||= ratings.map(&:average)
      end
    end
  end
end

