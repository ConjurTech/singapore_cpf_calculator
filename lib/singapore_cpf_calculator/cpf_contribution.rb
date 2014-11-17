module SingaporeCPFCalculator

  # Result object that describes the total, employee, and employer contribution.
  class CPFContribution

    attr_reader :total, :employee

    def initialize(total:, employee:)
      @total = total
      @employee = employee
    end

    # @return [BigDecimal] difference between the total and employee contributions
    def employer
      @employer ||= total - employee
    end

    # @param [CPFContribution] other
    # @return [true, false]
    def ==(other)
      total == other.total && employee == other.employee
    end

  end
end
