module SingaporeCPFCalculator
  module Year2014
    module CitizenOrSPR3

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 to 55.
      class Age50To55ContributionCalculator < Year2014::Base

        extend Requirements::GroupAbove50To55Years

        private

        def tc_rate_1
          "0.14"
        end

        def tc_rate_2
          "0.325"
        end

        def adjustment_rate
          "0.555"
        end

        def ec_rate
          "0.185"
        end


      end

    end
  end
end
