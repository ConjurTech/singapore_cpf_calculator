module SingaporeCPFCalculator
  module Year2014
    module SPR2GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 60 to 65.
      class Age60To65ContributionCalculator < Year2014::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            60.0 < age && age <= 65.0
          end

        end

        private

        def tc_rate_1
          "0.035"
        end

        def tc_rate_2
          "0.11"
        end

        def adjustment_rate
          "0.225"
        end

        def ec_rate
          "0.075"
        end

      end

    end
  end
end
