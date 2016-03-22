module SingaporeCPFCalculator
  module Year2015

    # Base class for 2014 CPF calculators.
    class Base < BaseCalculator
      include SingaporeCPFCalculator::Year2012To2015AwCeilingModule

      private

      def capped_ordinary_wages
        [d("5_000"), ordinary_wages].min
      end

    end

  end

end
