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
                           employee_contribution_type: nil,
                           employer_contribution_type: nil
    }

    let(:age) { 30 }
    let(:date) { Date.new(2014, 11, 15) }
    let(:residency_status) { "permanent_resident" }
    let(:spr_start_date) { Date.new(2011, 11, 14) }
    let(:ordinary_wages) { 700.00 }
    let(:additional_wages) { 252.00 }

    it { expect(result).to eq "total" => 343.00, "employee" => 190.00, "employer" => 153.00 }

  end

end
