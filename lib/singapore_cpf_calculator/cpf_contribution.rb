module SingaporeCPFCalculator

  # Result object that describes the total, employee, and employer contribution.
  class CPFContribution

    # @return [BigDecimal]
    attr_reader :total, :employee

    # @param [BigDecimal] total the total contribution amount
    # @param [BigDecimal] employee the employee contribution amount
    def initialize(total:, employee:)
      @total = total
      @employee = employee
    end

    # @return [BigDecimal] difference between the total and employee contributions
    def employer
      @employer ||= total - employee
    end

    # @param [CPFContribution] other
    # @return [TrueClass, FalseClass]
    def ==(other)
      total == other.total && employee == other.employee
    end

  end
end
