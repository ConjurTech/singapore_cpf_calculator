require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::CitizenOrSPR3::Age55To60ContributionCalculator do

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
      it { expect(result).to equal_cpf total: 5.00, employee: 0.00, employer: 5.00 }
    end

    context "when the total wages amounts to 52.38" do
      let(:ordinary_wages) { 52.38 }
      it { expect(result).to equal_cpf total: 5.00, employee: 0.00, employer: 5.00 }
    end

    context "when the total wages amounts to 502.56" do
      let(:ordinary_wages) { 502.56 }
      it { expect(result).to equal_cpf total: 54.00, employee: 0.00, employer: 54.00 }
    end

    context "when the total wages amounts to 502.57" do
      let(:ordinary_wages) { 502.57 }
      it { expect(result).to equal_cpf total: 54.00, employee: 1.00, employer: 53.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to equal_cpf total: 176.00, employee: 97.00, employer: 79.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to equal_cpf total: 176.00, employee: 97.00, employer: 79.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to equal_cpf total: 1_175.00, employee: 650.00, employer: 525.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to equal_cpf total: 1_175.00, employee: 650.00, employer: 525.00 }
    end

  end

end
