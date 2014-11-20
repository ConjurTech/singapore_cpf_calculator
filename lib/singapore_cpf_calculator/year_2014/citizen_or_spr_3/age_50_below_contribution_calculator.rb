module SingaporeCPFCalculator
  module Year2014
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age50BelowContributionCalculator < Year2014::Base

        extend Requirements::Group50YearsAndBelow

        private

        def tc_rate_1
          "0.16"
        end

        def tc_rate_2
          "0.36"
        end

        def adjustment_rate
          "0.6"
        end

        def ec_rate
          "0.20"
        end

      end

    end
  end
end
