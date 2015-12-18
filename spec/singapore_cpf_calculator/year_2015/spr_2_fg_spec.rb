require 'spec_helper'

describe SingaporeCPFCalculator::Year2015::SPR2FG do

  subject(:mod) { described_class }

  describe ".applies_to?" do
    let(:current_date) { Date.new(2015, 7, 1) }
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
      let(:spr_start_date) { Date.new(2013, 6, 20) }
      it { expect( result ).to be_falsey }
    end

    context "when the employee is a permanent resident on their 2nd year" do
      let(:status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2014, 6, 20) }

      context "for full employer and employee contribution type" do
        let(:employee_contribution_type) { "full" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end

      context "for graduated employer and employee contribution type" do
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "graduated" }
        it { expect( result ).to be_falsey }
      end

      context "for full employer and graduated employee contribution type" do
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_truthy }
      end
    end

    context "when the employee is a permanent resident on their 1st year" do
      let(:status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2015, 6, 20) }

      context "for full employer and employee contribution type" do
        let(:employee_contribution_type) { "full" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end

      context "for graduated employer and employee contribution type" do
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "graduated" }
        it { expect( result ).to be_falsey }
      end

      context "for full employer and graduated employee contribution type" do
        let(:employee_contribution_type) { "graduated" }
        let(:employer_contribution_type) { "full" }
        it { expect( result ).to be_falsey }
      end
    end

  end

  describe "calculator_for" do
    let(:calculator) { mod.calculator_for(current_date, birthdate: birthdate) }
    let(:current_date) { Date.new(2015, 9, 15) }

    context "when the employee's age is 50 or below" do
      context "lower limit" do
        let(:birthdate) { Date.new(1997, 8, 15) }

        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age50BelowContributionCalculator
        }
      end

      context "upper limit" do
        let(:birthdate) { Date.new(1965, 9, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age50BelowContributionCalculator
        }
      end
    end

    context "when the employee's age is above 50 to 55" do
      context "lower limit" do
        let(:birthdate) { Date.new(1964, 8, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age50To55ContributionCalculator
        }
      end

      context "upper limit" do
        let(:birthdate) { Date.new(1960, 9, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age50To55ContributionCalculator
        }
      end
    end

    context "when the employee's age is above 55 to 60" do
      context "lower limit" do
        let(:birthdate) { Date.new(1959, 8, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age55To60ContributionCalculator
        }
      end

      context "upper limit" do
        let(:birthdate) { Date.new(1955, 9, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age55To60ContributionCalculator
        }
      end
    end

    context "when the employee's age is above 60 to 65" do
      context "lower limit" do
        let(:birthdate) { Date.new(1954, 8, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age60To65ContributionCalculator
        }
      end

      context "upper limit" do
        let(:birthdate) { Date.new(1950, 9, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age60To65ContributionCalculator
        }
      end
    end

    context "when the employee's age is 65 or above" do
      context "lower limit" do
        let(:birthdate) { Date.new(1949, 8, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age65UpContributionCalculator
        }
      end

      context "upper limit" do
        let(:birthdate) { Date.new(1915, 8, 15) }
        it {
          expect( calculator ).
            to be SingaporeCPFCalculator::Year2015::SPR2FG::Age65UpContributionCalculator
        }
      end
    end
  end

end
