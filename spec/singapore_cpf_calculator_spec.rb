require 'spec_helper'

describe SingaporeCPFCalculator do

  subject(:calculator) { described_class }

  describe "#calculate" do

    let(:result) {
      calculator.calculate age: age,
                           date: date,
                           residency_status: residency_status,
                           spr_start_date: spr_start_date,
                           ordinary_wages: ordinary_wages,
                           additional_wages: additional_wages,
                           employee_contribution_type: employee_contribution_type,
                           employer_contribution_type: employer_contribution_type
    }

    describe "30 years old permanent resident earning $952.00 a month" do
      let(:age) { 30 }
      let(:date) { Date.new(2014, 11, 15) }
      let(:residency_status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2011, 11, 14) }
      let(:ordinary_wages) { 700.00 }
      let(:additional_wages) { 252.00 }
      let(:employee_contribution_type) { nil }
      let(:employer_contribution_type) { nil }

      it { expect(result).to eq "total" => 343.00, "employee" => 190.00, "employer" => 153.00 }
    end

    describe "30 years old earning $952.00 a month before permanent residency" do
      let(:age) { 30 }
      let(:date) { Date.new(2014, 11, 15) }
      let(:residency_status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2015, 11, 14) }
      let(:ordinary_wages) { 700.00 }
      let(:additional_wages) { 252.00 }
      let(:employee_contribution_type) { "graduated" }
      let(:employer_contribution_type) { "graduated" }

      it { expect(result).to eq "total" => 0.00, "employee" => 0.00, "employer" => 0.00 }
    end

  end

end
