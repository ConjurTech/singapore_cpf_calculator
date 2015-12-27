require 'spec_helper'

describe SingaporeCPFCalculator::Year2016 do

  subject(:year_module) { described_class }

  describe ".applies_to?" do
    context "when the date falls into the year 2014" do
      let(:date) { Date.new(2014, 11, 15) }
      it { expect( year_module.applies_to? date ).to be_falsey }
    end

    context "when the date falls into the year 2015" do
      let(:date) { Date.new(2015, 1, 1) }
      it { expect( year_module.applies_to? date ).to be_falsey }
    end

    context "when the date falls into the year 2016" do
      let(:date) { Date.new(2016, 1, 1) }
      it { expect( year_module.applies_to? date ).to be_truthy }
    end
  end

  describe ".module_for_residency" do

    let(:mod) {
      year_module.module_for_residency status: status,
                                       current_date: current_date,
                                       spr_start_date: spr_start_date,
                                       employee_contribution_type: employee_contribution_type,
                                       employer_contribution_type: employer_contribution_type
    }

    let(:current_date) { Date.new(2016, 11, 15) }
    let(:employee_contribution_type) { nil }
    let(:employer_contribution_type) { nil }

    context "when the employee is a citizen" do
      let(:status) { "citizen" }
      let(:spr_start_date) { nil }

      it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
    end

    context "when the employee is a permanent resident" do
      let(:status) { "permanent_resident" }

      context "when the employee is in their year 1 of permanent residency" do
        context "on the start of the SPR1" do
          let(:spr_start_date) { Date.new(2016, 6, 20) }
          let(:current_date) { Date.new(2016, 6, 20) }

          context "when the employer pays partial contribution" do
            let(:employer_contribution_type) { "graduated" }


            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR1GG }
            end
          end

          context "when the employer pays full contribution" do
            let(:employer_contribution_type) { "full" }

            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR1FG }
            end

            context "when employee pays full" do
              let(:employee_contribution_type) { "full" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
            end
          end
        end

        context "on the end of the SPR1" do
          let(:spr_start_date) { Date.new(2015, 6, 20) }
          let(:current_date) { Date.new(2016, 6, 30) }

          context "when the employer pays partial contribution" do
            let(:employer_contribution_type) { "graduated" }

            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR1GG }
            end
          end

          context "when the employer pays full contribution" do
            let(:employer_contribution_type) { "full" }

            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR1FG }
            end

            context "when employee pays full" do
              let(:employee_contribution_type) { "full" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
            end
          end
        end
      end

      context "when the employee is in their year 2 of permanent residency" do
        context "on the start of the SPR2" do
          let(:spr_start_date) { Date.new(2015, 6, 20) }
          let(:current_date) { Date.new(2016, 7, 1) }

          context "when the employer pays partial contribution" do
            let(:employer_contribution_type) { "graduated" }


            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR2GG }
            end
          end

          context "when the employer pays full contribution" do
            let(:employer_contribution_type) { "full" }

            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR2FG }
            end

            context "when employee pays full" do
              let(:employee_contribution_type) { "full" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
            end
          end
        end

        context "on the end of the SPR2" do
          let(:spr_start_date) { Date.new(2014, 6, 20) }
          let(:current_date) { Date.new(2016, 6, 30) }

          context "when the employer pays partial contribution" do
            let(:employer_contribution_type) { "graduated" }


            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR2GG }
            end
          end

          context "when the employer pays full contribution" do
            let(:employer_contribution_type) { "full" }

            context "when employee pays partial" do
              let(:employee_contribution_type) { "graduated" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::SPR2FG }
            end

            context "when employee pays full" do
              let(:employee_contribution_type) { "full" }
              it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
            end
          end
        end
      end

      context "when the employee is in their year 3 of permanent residency" do
        context "on the start of the SPR3" do
          let(:spr_start_date) { Date.new(2014, 6, 20) }
          let(:current_date) { Date.new(2016, 7, 1) }

          it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
        end

        context "on SPR3 period" do
          let(:spr_start_date) { Date.new(2012, 6, 20) }
          let(:current_date) { Date.new(2016, 6, 30) }

          it { expect(mod).to be SingaporeCPFCalculator::Year2016::CitizenOrSPR3 }
        end
      end

    end


  end
end
