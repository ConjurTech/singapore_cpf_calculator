require 'spec_helper'

describe SingaporeCPFCalculator::Year2016::CitizenOrSPR3::Age55To60ContributionCalculator do

  subject(:calculator) {
    described_class.new ordinary_wages: ordinary_wages,
                        additional_wages: additional_wages
  }

  let(:result) { calculator.calculate }

  let(:additional_wages) { 0.0 }

  describe "#calculate" do

    context "when the total wages amounts to 0.00" do
      let(:ordinary_wages) { 0.00 }
      it { expect(result).to equal_cpf total: 0.00, employee: 0.00, employer: 0.00 }
    end

    context "when the total wages amounts to 50.00" do
      let(:ordinary_wages) { 50.00 }
      it { expect(result).to equal_cpf total: 0.00, employee: 0.00, employer: 0.00 }
    end

    context "when the total wages amounts to 50.01" do
      let(:ordinary_wages) { 50.01 }
      it { expect(result).to equal_cpf total: 7.00, employee: 0.00, employer: 7.00 }
    end

    context "when the total wages amounts to 500.00" do
      let(:ordinary_wages) { 500.00 }
      it { expect(result).to equal_cpf total: 65.00, employee: 0.00, employer: 65.00 }
    end

    context "when the total wages amounts to 500.01" do
      let(:ordinary_wages) { 500.01 }
      it { expect(result).to equal_cpf total: 65.00, employee: 0.00, employer: 65.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to equal_cpf total: 195.00, employee: 97.00, employer: 98.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to equal_cpf total: 195.00, employee: 97.00, employer: 98.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to equal_cpf total: 1_300.00, employee: 650.00, employer: 600.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to equal_cpf total: 1_560.00, employee: 780.00, employer: 780.00 }
    end

  end

end
