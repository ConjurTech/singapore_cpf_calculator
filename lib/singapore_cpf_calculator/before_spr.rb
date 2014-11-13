require_relative "null_contribution_calculator"

module SingaporeCPFCalculator

  # Residency module for Singaporean Permanent Residents before theirs status effectivity.
  module BeforeSPR

    class << self

      # @param [String] status: ["citizen", "permanent_resident", "foreigner"]
      # @param [Date] current_date: current date used to determine permanent residency's duration
      # @param [Date] spr_start_date: date when the permanent residency started
      # @return [true, false]
      def applies_to?(
        status:,
        current_date:,
        spr_start_date:,
        **
      )
        status == "permanent_resident" && (
          spr_start_date.year > current_date.year ||
          ( spr_start_date.year == current_date.year && spr_start_date.month > current_date.month )
        )
      end

      # @param [Fixnum] age
      # @return [#calculator] returns the CPF calculator that matches the age.
      def calculator_for(age)
        NullContributionCalculator
      end

    end

  end
end
