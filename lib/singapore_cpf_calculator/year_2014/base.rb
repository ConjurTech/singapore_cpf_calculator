module SingaporeCPFCalculator
  module Year2014

    # Base class for 2014 CPF calculators.
    class Base < BaseCalculator

      private

      def capped_ordinary_wages
        [d("5_000"), ordinary_wages].min
      end

    end

  end

end
