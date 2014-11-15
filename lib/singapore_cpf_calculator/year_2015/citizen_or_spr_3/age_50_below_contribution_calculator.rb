module SingaporeCPFCalculator
  module Year2015
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age50BelowContributionCalculator < Year2015::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            age <= 50.0
          end

        end

        private

        def tc_rate_1
          d("0.17")
        end

        def tc_rate_2
          d("0.37")
        end

        def ec_rate
          d("0.20")
        end

        def adjustment_rate
          d("0.6")
        end

      end

    end
  end
end
