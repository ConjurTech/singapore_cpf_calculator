module SingaporeCPFCalculator
  module Year2015
    module CitizenOrSPR3

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

        def calculated_total_contribution
          case
          when total_wages <= d("50.00")
            d("0.0")
          when total_wages <= d("500.00")
            (d("0.085")) * total_wages
          when total_wages < d("750.00")
            ((d("0.085")) * total_wages) + (d("0.225") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.16") * capped_ordinary_wages) + (d("0.16") * additional_wages)
          end
        end

        def calculated_employee_contribution
          case
          when total_wages < d("500.0000")
            d("0.0")
          when total_wages < d("750.0000")
            (d("0.225") * (total_wages - d("500.00")))
          else # >= $750
            (d("0.075") * capped_ordinary_wages) + (d("0.075") * additional_wages)
          end
        end

      end

    end
  end
end
