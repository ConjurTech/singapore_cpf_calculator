module SingaporeCPFCalculator
  # Base class for CPF calculators.
  class BaseCalculator

    class << self
      # @param [Fixnum] age
      # @return [true, false] returns true if the calculator applies to the employee's age.
      def applies_to?(_age)
        raise NotImplementedError, "sub classes needs to implement .applies_to?(age)"
      end

      # @param [BigDecimal] ordinary_wages:
      #   Ordinary wages are wages due or granted in respect of employment and include allowances (e.g.
      #   food allowance and overtime payments) earned by an employee in the month and payable before
      #   the due date for payment of CPF contributions for that month.
      # @param [BigDecimal] additional_wages:
      #   Additional wages are wage supplements which are not granted wholly and exclusively for the
      #   month, such as annual bonus and leave pay. These and other incentive payments may be made at
      #   intervals of more than a month.
      #
      # @return [Hash] returns the total, employee, employer amounts for the CPF contribution
      def calculate(ordinary_wages:, additional_wages:)
        new(ordinary_wages: ordinary_wages, additional_wages: additional_wages).calculate
      end
    end

    def initialize(ordinary_wages:, additional_wages:)
      @ordinary_wages = ordinary_wages
      @additional_wages = additional_wages
    end

    # @return [Hash] returns the total, employee, employer amounts for the CPF contribution
    def calculate
      {
        "total" => total_contribution,
        "employee" => employee_contribution,
        "employer" => employer_contribution,
      }
    end

    private

    attr_reader :ordinary_wages, :additional_wages

    def total_contribution
      @total_contribution ||= calculated_total_contribution.round(0, :half_up)
    end

    def employee_contribution
      @employee_contribution ||= calculated_employee_contribution.round(0, :truncate)
    end

    def employer_contribution
      @employer_contribution ||= total_contribution - employee_contribution
    end

    def total_wages
      ordinary_wages + additional_wages
    end

    def calculated_total_contribution
      raise NotImplementedError, "sub classes needs to implement #calculated_total_contribution"
    end

    def calculated_employee_contribution
      raise NotImplementedError, "sub classes needs to implement #calculated_employee_contribution"
    end

    def capped_ordinary_wages
      raise NotImplementedError, "sub classes needs to implement #capped_ordinary_wages"
    end

    # precision helper
    def d(val)
      BigDecimal.new val
    end

  end
end
