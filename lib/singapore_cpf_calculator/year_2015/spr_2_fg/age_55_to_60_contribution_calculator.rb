module SingaporeCPFCalculator
  module Year2015
    module SPR2FG

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

        def calculated_total_contribution
          case
          when total_wages <= d("50.00")
            d("0.0")
          when total_wages <= d("500.00")
            (d("0.12")) * total_wages
          when total_wages < d("750.00")
            ((d("0.12")) * total_wages) + (d("0.375") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.245") * capped_ordinary_wages) + (d("0.245") * additional_wages)
          end
        end

        def calculated_employee_contribution
          case
          when total_wages < d("500.00")
            d("0.0")
          when total_wages < d("750.00")
            (d("0.375") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.125") * capped_ordinary_wages) + (d("0.125") * additional_wages)
          end
        end

        def tc_rate_1
          d("0.12")
        end

        def tc_rate_2
          d("0.245")
        end

        def ec_rate
          d("0.125")
        end

        def adjustment_rate
          d("0.375")
        end

      end

    end
  end
end
