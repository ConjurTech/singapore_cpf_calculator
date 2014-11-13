module SingaporeCPFCalculator

  # Null CPF calculators.
  module NullContributionCalculator

    class << self

      # returns zero value
      def calculate(*)
        {
          "total" => BigDecimal.new("0.0"),
          "employee" => BigDecimal.new("0.0"),
          "employer" => BigDecimal.new("0.0"),
        }
      end

    end

  end
end
