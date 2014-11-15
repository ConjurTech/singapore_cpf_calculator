module SingaporeCPFCalculator
  module Year2014
    module SPR1GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 65 and above.
      class Age65UpContributionCalculator < Year2014::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            65.0 < age
          end

        end

        private

        def tc_rate_1
          d "0.035"
        end

        def tc_rate_2
          d "0.085"
        end

        def adjustment_rate
          d "0.15"
        end

        def ec_rate
          d "0.05"
        end

      end

    end
  end
end
