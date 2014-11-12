require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::CitizenOrSPR3::Age60To65ContributionCalculator do

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
      it { expect(result).to eq "total" => 4.00, "employee" => 0.00, "employer" => 4.00 }
    end

    context "when the total wages amounts to 64.28" do
      let(:ordinary_wages) { 64.28 }
      it { expect(result).to eq "total" => 4.00, "employee" => 0.00, "employer" => 4.00 }
    end

    context "when the total wages amounts to 504.44" do
      let(:ordinary_wages) { 504.44 }
      it { expect(result).to eq "total" => 36.00, "employee" => 0.00, "employer" => 36.00 }
    end

    context "when the total wages amounts to 504.45" do
      let(:ordinary_wages) { 504.45 }
      it { expect(result).to eq "total" => 36.00, "employee" => 1.00, "employer" => 35.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to eq "total" => 109.00, "employee" => 56.00, "employer" => 53.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to eq "total" => 109.00, "employee" => 56.00, "employer" => 53.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to eq "total" => 725.00, "employee" => 375.00, "employer" => 350.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to eq "total" => 725.00, "employee" => 375.00, "employer" => 350.00 }
    end

  end

end
