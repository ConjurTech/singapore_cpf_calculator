module SingaporeCPFCalculator
  module Year2015
    module SPR1GG

    # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
    class Age55To60ContributionCalculator < Age50BelowContributionCalculator

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            55.0 < age && age <= 60.0
          end

        end

    end

    end
  end
end
