require 'spec_helper'

describe "Company A" do

  CSV.foreach('spec/acceptance/company_a.csv', headers: true) do |row|
    context "test: #{row.to_a}" do
      let(:result) {
        SingaporeCPFCalculator.calculate date: date,
                                         birthdate: birthdate,
                                         residency_status: residency_status,
                                         spr_start_date: spr_start_date,
                                         ordinary_wages: ordinary_wages,
                                         additional_wages: additional_wages,
                                         employee_contribution_type: employee_contribution_type,
                                         employer_contribution_type: employer_contribution_type
      }

      let(:expected_result) {
        SingaporeCPFCalculator::CPFContribution.new total: BigDecimal.new(row["Total CPF$"]),
                                                    employee: BigDecimal.new(row["Employee CPF$"])
      }

      let(:date) { row["Contribution Date"].to_date }
      let(:birthdate) { row["Birthdate"].to_date }
      let(:residency_status) { row["Residency Status"] }
      let(:spr_start_date) { row["SPR Start Date"].try(:to_date) }
      let(:ordinary_wages) { BigDecimal.new row["Ordinary Wages"] }
      let(:additional_wages) { BigDecimal.new row["Additional Wages"] }
      let(:employee_contribution_type) { row["Employee Contribution Type"] }
      let(:employer_contribution_type) { row["Employer Contribution Type"] }

      it { expect(result).to eq expected_result }
    end
  end

end
