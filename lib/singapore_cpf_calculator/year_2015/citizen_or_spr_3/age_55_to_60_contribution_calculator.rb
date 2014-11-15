module SingaporeCPFCalculator
  module Year2015
    module CitizenOrSPR3

    # Payment calculator for Singapore's Central Provident Fund for employee's age 55 to 60.
    class Age55To60ContributionCalculator < Year2015::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            55.0 < age && age <= 60.0
          end

        end

        private

        def tc_rate_1
          "0.12"
        end

        def tc_rate_2
          "0.25"
        end

        def ec_rate
          "0.13"
        end

        def adjustment_rate
          "0.39"
        end

      end

    end
  end
end
