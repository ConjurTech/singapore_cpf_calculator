module SingaporeCPFCalculator
  module Year2015
    module SPR2FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 60 to 65.
      class Age60To65ContributionCalculator < Year2015::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            60.0 < age && age <= 65.0
          end

        end

        private

        def tc_rate_1
          d("0.085")
        end

        def tc_rate_2
          d("0.16")
        end

        def ec_rate
          d("0.075")
        end

        def adjustment_rate
          d("0.225")
        end

      end

    end
  end
end
