module SingaporeCPFCalculator
  module Year2014
    module SPR2FG

    # Payment calculator for Singapore's Central Provident Fund for employee's age 50 to 55.
    class Age50To55ContributionCalculator < Year2014::Base

        class << self

          # @param [String] age age of the employee
          # @return [true, false] returns true if the matches.
          def applies_to?(age)
            50.0 < age && age <= 55.0
          end

        end

        private

        def calculated_total_contribution
          case
          when total_wages <= d("50.00")
            d("0.0")
          when total_wages <= d("500.00")
            (d("0.14")) * total_wages
          when total_wages < d("750.00")
            ((d("0.14")) * total_wages) + (d("0.45") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.29") * capped_ordinary_wages) + (d("0.29") * additional_wages)
          end
        end

        def calculated_employee_contribution
          case
          when total_wages < d("500.00")
            d("0.0")
          when total_wages < d("750.00")
            (d("0.45") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.15") * capped_ordinary_wages) + (d("0.15") * additional_wages)
          end
        end

      end

    end
  end
end
