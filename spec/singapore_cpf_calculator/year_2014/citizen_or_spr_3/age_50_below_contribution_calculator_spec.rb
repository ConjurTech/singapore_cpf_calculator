require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::CitizenOrSPR3::Age50BelowContributionCalculator do

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
      it { expect(result).to equal_cpf total: 8.00, employee: 0.00, employer: 8.00 }
    end

    context "when the total wages amounts to 53.12" do
      let(:ordinary_wages) { 53.12 }
      it { expect(result).to equal_cpf total: 8.00, employee: 0.00, employer: 8.00 }
    end

    context "when the total wages amounts to 501. 66" do
      let(:ordinary_wages) { 501.66 }
      it { expect(result).to equal_cpf total: 81.00, employee: 0.00, employer: 81.00 }
    end

    context "when the total wages amounts to 501.67" do
      let(:ordinary_wages) { 501.67 }
      it { expect(result).to equal_cpf total: 81.00, employee: 1.00, employer: 80.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to equal_cpf total: 270.00, employee: 149.00, employer: 121.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to equal_cpf total: 270.00, employee: 150.00, employer: 120.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to equal_cpf total: 1_800.00, employee: 1_000.00, employer: 800.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to equal_cpf total: 1_800.00, employee: 1_000.00, employer: 800.00 }
    end

  end

end
