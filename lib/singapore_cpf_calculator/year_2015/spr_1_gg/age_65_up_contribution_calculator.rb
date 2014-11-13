module SingaporeCPFCalculator
  module Year2015
    module SPR1GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 65 and above.
      class Age65UpContributionCalculator < Age60To65ContributionCalculator

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            65.0 < age
          end

        end

      end

    end
  end
end
