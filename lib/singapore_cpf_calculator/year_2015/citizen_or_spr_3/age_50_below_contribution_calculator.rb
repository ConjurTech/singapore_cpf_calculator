module SingaporeCPFCalculator
  module Year2015
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 and below.
      class Age50BelowContributionCalculator < CitizenOrSpr3Base

        extend Requirements::Group50YearsAndBelow

        private

        def tc_rate_1
          "0.17"
        end

        def tc_rate_2
          "0.37"
        end

        def ec_rate
          "0.20"
        end

        def adjustment_rate
          "0.6"
        end

      end

    end
  end
end
