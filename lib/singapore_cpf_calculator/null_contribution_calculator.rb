module SingaporeCPFCalculator

  # Null CPF calculators.
  module NullContributionCalculator

    class << self

      # returns zero value
      def calculate(*)
        CPFContribution.new total: BigDecimal.new("0.0"),
                            employee: BigDecimal.new("0.0")
      end

    end

  end
end
