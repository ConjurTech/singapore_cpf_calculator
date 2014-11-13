module SingaporeCPFCalculator
  module Year2015

    # For Singapore Permanent Resident (SPR) on their second year with graduated (G, partial)
    # employee contribution and full (F) employer contribution
    module SPR2FG

      class << self

        # @param [String] status: ["citizen", "permanent_resident", "foreigner"]
        # @param [Date] current_date: current date used to determine permanent residency's duration
        # @param [Date] spr_start_date: date when the permanent residency started
        # @param [String] employee_contribution_type: ["full", "graduated"]
        # @param [String] employer_contribution_type: ["full", "graduated"]
        # @return [true, false]
        def applies_to?(
          status:,
          current_date:,
          spr_start_date:,
          employee_contribution_type:,
          employer_contribution_type:
        )
          status == "permanent_resident" &&
            current_date.between?(spr_start_date + 1.year, spr_start_date + 2.years) &&
            employee_contribution_type == "graduated" &&
            employer_contribution_type == "full"
        end

        # @param [Fixnum] age
        # @return [#calculator] returns the CPF calculator that matches the age.
        def calculator_for(age)
          calculators.find { |calculator| calculator.applies_to? age }
        end

        private

        def calculators
          [
            Age50BelowContributionCalculator,
            Age50To55ContributionCalculator,
            Age55To60ContributionCalculator,
            Age60To65ContributionCalculator,
            Age65UpContributionCalculator,
          ]
        end

      end

    end

  end
end

require_relative "spr_2_fg/age_50_below_contribution_calculator"
require_relative "spr_2_fg/age_50_to_55_contribution_calculator"
require_relative "spr_2_fg/age_55_to_60_contribution_calculator"
require_relative "spr_2_fg/age_60_to_65_contribution_calculator"
require_relative "spr_2_fg/age_65_up_contribution_calculator"
