module SingaporeCPFCalculator
  module Year2014
    module SPR2GG

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
          "0.06"
        end

        def tc_rate_2
          "0.185"
        end

        def adjustment_rate
          "0.375"
        end

        def ec_rate
          "0.125"
        end

      end

    end
  end
end
