module SingaporeCPFCalculator
  module Year2014
    module SPR1FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age50BelowContributionCalculator < Year2014::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            age <= 50.0
          end

        end

        private

        def tc_rate_1
          "0.16"
        end

        def tc_rate_2
          "0.21"
        end

        def adjustment_rate
          "0.15"
        end

        def ec_rate
          "0.05"
        end


      end

    end
  end
end
