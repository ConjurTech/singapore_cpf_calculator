require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::CitizenOrSPR3::Age50To55ContributionCalculator do

  subject(:calculator) {
    described_class.new ordinary_wages: ordinary_wages,
                        additional_wages: additional_wages
  }

  let(:result) { calculator.calculate }

  let(:additional_wages) { 0.0 }

  describe "#calculate" do

    context "when the total wages amounts to 0.00" do
      let(:ordinary_wages) { 0.00 }
      it { expect(result).to eq "total" => 0.00, "employee" => 0.00, "employer" => 0.00 }
    end

    context "when the total wages amounts to 50.00" do
      let(:ordinary_wages) { 50.00 }
      it { expect(result).to eq "total" => 0.00, "employee" => 0.00, "employer" => 0.00 }
    end

    context "when the total wages amounts to 50.01" do
      let(:ordinary_wages) { 50.01 }
      it { expect(result).to eq "total" => 7.00, "employee" => 0.00, "employer" => 7.00 }
    end

    context "when the total wages amounts to 53.12" do
      let(:ordinary_wages) { 53.57 }
      it { expect(result).to eq "total" => 7.00, "employee" => 0.00, "employer" => 7.00 }
    end

    context "when the total wages amounts to 501.80" do
      let(:ordinary_wages) { 501.80 }
      it { expect(result).to eq "total" => 71.00, "employee" => 0.00, "employer" => 71.00 }
    end

    context "when the total wages amounts to 501.81" do
      let(:ordinary_wages) { 501.81 }
      it { expect(result).to eq "total" => 71.00, "employee" => 1.00, "employer" => 70.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to eq "total" => 244.00, "employee" => 138.00, "employer" => 106.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to eq "total" => 244.00, "employee" => 138.00, "employer" => 106.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to eq "total" => 1_625.00, "employee" => 925.00, "employer" => 700.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to eq "total" => 1_625.00, "employee" => 925.00, "employer" => 700.00 }
    end

  end

end
