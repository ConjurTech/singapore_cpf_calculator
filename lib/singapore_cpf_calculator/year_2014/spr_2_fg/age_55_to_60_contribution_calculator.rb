module SingaporeCPFCalculator
  module Year2014
    module SPR2FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
      class Age55To60ContributionCalculator < Year2014::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            55.0 < age && age <= 60.0
          end

        end

        private

        def tc_rate_1
          d "0.105"
        end

        def tc_rate_2
          d "0.23"
        end

        def adjustment_rate
          d "0.375"
        end

        def ec_rate
          d "0.125"
        end

      end

    end
  end
end
