module SingaporeCPFCalculator
  module Year2015

    # For Singapore Permanent Resident (SPR) on their first year with graduated (G, partial)
    # employer contribution and graduated (G, partial) employee contribution
    module SPR2GG

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
            SPRStatus.get(current_date, status_start_date: spr_start_date) == "SPR2" &&
            employee_contribution_type == "graduated" &&
            employer_contribution_type == "graduated"
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

require_relative "spr_2_gg/age_50_below_contribution_calculator"
require_relative "spr_2_gg/age_50_to_55_contribution_calculator"
require_relative "spr_2_gg/age_55_to_60_contribution_calculator"
require_relative "spr_2_gg/age_60_to_65_contribution_calculator"
require_relative "spr_2_gg/age_65_up_contribution_calculator"
