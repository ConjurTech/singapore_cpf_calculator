module SingaporeCPFCalculator
  module Year2015
    module SPR1GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age50BelowContributionCalculator < Year2015::Base

        extend Requirements::Group50YearsAndBelow

        private

        def tc_rate_1
          "0.04"
        end

        def tc_rate_2
          "0.09"
        end

        def ec_rate
          "0.05"
        end

        def adjustment_rate
          "0.15"
        end

      end

    end
  end
end
