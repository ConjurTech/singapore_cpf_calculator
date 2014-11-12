require 'spec_helper'

describe SingaporeCPFCalculator::Year2014::SPR1GG do

  subject(:mod) { described_class }

  describe ".applies_to?" do
    let(:current_date) { Date.new(2014, 11, 15) }
    let(:spr_start_date) { nil }
    let(:employee_contribution_type) { nil }
    let(:employer_contribution_type) { nil }

    let(:result) {
      mod.applies_to? status: status,
                      current_date: current_date,
                      spr_start_date: spr_start_date,
                      employee_contribution_type: employee_contribution_type,
                      employer_contribution_type: employer_contribution_type
    }

    context "when the employee is a citizen" do
      let(:status) { "citizen" }
      it { expect( result ).to be_falsey }
    end

    context "when the employee is a permanent resident on their 3rd year" do
      let(:status) { "permanent_resident" }
      let(:spr_start_date) { current_date - 2.years - 1.day }
      it { expect( result ).to be_falsey }
    end

    context "when the employee is a permanent resident on their 2nd year" do
      context "for full employer and employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date - 1.years - 1.day }
        let(:employee_contribution_type) { "full" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end

      context "for graduated employer and employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date - 1.years - 1.day }
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "graduated" }
        it { expect( result ).to be_falsey }
      end

      context "for full employer and graduated employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date - 1.years - 1.day }
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end
    end

    context "when the employee is a permanent resident on their 1st year" do
      context "for full employer and employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date }
        let(:employee_contribution_type) { "full" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end

      context "for graduated employer and employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date }
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "graduated" }
        it { expect( result ).to be_truthy }
      end

      context "for full employer and graduated employee contribution type" do
        let(:status) { "permanent_resident" }
        let(:spr_start_date) { current_date }
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end
    end

  end

  describe "calculator_for" do
    let(:calculator) { mod.calculator_for(age) }

    context "when the employee's age is 50 or below" do
      context "lower limit" do
        let(:age) { 18.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age50BelowContributionCalculator
        }
      end

      context "upper limit" do
        let(:age) { 50.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age50BelowContributionCalculator
        }
      end
    end

    context "when the employee's age is above 50 to 55" do
      context "lower limit" do
        let(:age) { 50.01 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age50To55ContributionCalculator
        }
      end

      context "upper limit" do
        let(:age) { 55.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age50To55ContributionCalculator
        }
      end
    end

    context "when the employee's age is above 55 to 60" do
      context "lower limit" do
        let(:age) { 55.01 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age55To60ContributionCalculator
        }
      end

      context "upper limit" do
        let(:age) { 60.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age55To60ContributionCalculator
        }
      end
    end

    context "when the employee's age is above 60 to 65" do
      context "lower limit" do
        let(:age) { 60.01 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age60To65ContributionCalculator
        }
      end

      context "upper limit" do
        let(:age) { 65.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age60To65ContributionCalculator
        }
      end
    end

    context "when the employee's age is 65 or above" do
      context "lower limit" do
        let(:age) { 65.01 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age65UpContributionCalculator
        }
      end

      context "upper limit" do
        let(:age) { 100.00 }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2014::SPR1GG::Age65UpContributionCalculator
        }
      end
    end
  end

end
