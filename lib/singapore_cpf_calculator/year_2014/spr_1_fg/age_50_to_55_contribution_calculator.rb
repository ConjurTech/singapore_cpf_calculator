module SingaporeCPFCalculator
  module Year2014
    module SPR1FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 to 55.
      class Age50To55ContributionCalculator < Age50BelowContributionCalculator

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            50.0 < age && age <= 55.0
          end

        end

        private

        def tc_rate_1
          d "0.14"
        end

        def tc_rate_2
          d "0.19"
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
