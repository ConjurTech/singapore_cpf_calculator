require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::SPR1FG::Age65UpContributionCalculator do

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
      it { expect(result).to eq "total" => 3.00, "employee" => 0.00, "employer" => 3.00 }
    end

    context "when the total wages amounts to 499.99" do
      let(:ordinary_wages) { 499.99 }
      it { expect(result).to eq "total" => 32.00, "employee" => 0.00, "employer" => 32.00 }
    end

    context "when the total wages amounts to 500.00" do
      let(:ordinary_wages) { 500.00 }
      it { expect(result).to eq "total" => 33.00, "employee" => 0.00, "employer" => 33.00 }
    end

    context "when the total wages amounts to 500.01" do
      let(:ordinary_wages) { 500.01 }
      it { expect(result).to eq "total" => 33.00, "employee" => 0.00, "employer" => 33.00 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to eq "total" => 86.00, "employee" => 37.00, "employer" => 49.00 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to eq "total" => 86.00, "employee" => 37.00, "employer" => 49.00 }
    end

    context "when the total wages amounts to 750.01" do
      let(:ordinary_wages) { 750.01 }
      it { expect(result).to eq "total" => 86.00, "employee" => 37.00, "employer" => 49.00 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to eq "total" => 575.00, "employee" => 250.00, "employer" => 325.00 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to eq "total" => 575.00, "employee" => 250.00, "employer" => 325.00 }
    end

  end

end
