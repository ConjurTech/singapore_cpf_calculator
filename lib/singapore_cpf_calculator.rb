require "singapore_cpf_calculator/version"
require "active_support/all"

module SingaporeCPFCalculator

  class << self
    # @example:
    #   result = SingaporeCPFCalculator.calculate age: 32,
    #                                             date: Date.new(2014, 11, 15),
    #                                             residency_status: "permanent_resident",
    #                                             spr_start_date: Date.new(2014, 11, 15),
    #                                             ordinary_wages: 700.00,
    #                                             additional_wages: 252.00,
    #                                             employee_contribution_type: "full",
    #                                             employer_contribution_type: "full"
    #
    #   result # => #<SingaporeCPFCalculator::CPFContribution ...>
    #   result.employee # => 190.00
    #   result.employer # => 153.00
    #   result.total # => 343.00
    #
    #
    # @param [Date] date: relevant date when the CPF contribution is being calculated
    # @param [Date] birthdate:
    # @param [String] residency_status: ["citizen", "permanent_resident"]
    # @param [Date] spr_start_date: date when the employee became a Singapore permanent resident
    # @param [String] employee_contribution_type: ["full", "graduated"]
    # @param [String] employer_contribution_type: ["full", "graduated"]
    # @param [BigDecimal] ordinary_wages:
    #   Ordinary wages are wages due or granted in respect of employment and include allowances (e.g.
    #   food allowance and overtime payments) earned by an employee in the month and payable before
    #   the due date for payment of CPF contributions for that month.
    # @param [BigDecimal] additional_wages:
    #   Additional wages are wage supplements which are not granted wholly and exclusively for the
    #   month, such as annual bonus and leave pay. These and other incentive payments may be made at
    #   intervals of more than a month.
    #
    # @return [CPFContribution]
    def calculate(
      date:,
      birthdate:,
      residency_status:,
      spr_start_date: nil,
      ordinary_wages:,
      additional_wages:,
      employee_contribution_type: nil,
      employer_contribution_type: nil
    )
      validate_params date: date,
                      employee_contribution_type: employee_contribution_type,
                      employer_contribution_type: employer_contribution_type,
                      residency_status: residency_status,
                      spr_start_date: spr_start_date

      module_for_date(date).
        module_for_residency(
          status: residency_status,
          spr_start_date: spr_start_date,
          current_date: date,
          employee_contribution_type: employee_contribution_type,
          employer_contribution_type: employer_contribution_type
        ).calculator_for(date, birthdate: birthdate).
        calculate ordinary_wages: ordinary_wages, additional_wages: additional_wages
    end

    private

    def validate_params(
      date:,
      employee_contribution_type:,
      employer_contribution_type:,
      residency_status:,
      spr_start_date:
    )
      if residency_status == "permanent_resident"
        raise ArgumentError, "spr_start_date: must be set" if spr_start_date.nil?
        if contribution_types_required?(date, spr_start_date)
          if employee_contribution_type.nil?
            raise ArgumentError, "employee_contribution_type: must be set"
          end
          if employer_contribution_type.nil?
            raise ArgumentError, "employer_contribution_type: must be set"
          end
        end
      end

      unless ["citizen", "permanent_resident"].include? residency_status
        raise ArgumentError, "unsupported residency status: #{ residency_status }"
      end
    end

    def contribution_types_required?(date, spr_start_date)
      date <= (spr_start_date + 2.years)
    end

    def module_for_date(date)
      date_modules.find { |mod| mod.applies_to? date } or
        raise ArgumentError, "could not find date module for #{ date }"
    end

    def date_modules
      [
        Year2014,
        Year2015,
      ]
    end
  end

end

require_relative "singapore_cpf_calculator/cpf_contribution"
require_relative "singapore_cpf_calculator/base_calculator"
require_relative "singapore_cpf_calculator/before_spr"
require_relative "singapore_cpf_calculator/age_group"
require_relative "singapore_cpf_calculator/spr_status"
require_relative "singapore_cpf_calculator/requirements"
require_relative "singapore_cpf_calculator/year_common"
require_relative "singapore_cpf_calculator/residency_module_common"
require_relative "singapore_cpf_calculator/citizen_or_spr_3_common"
require_relative "singapore_cpf_calculator/spr_1_fg_common"
require_relative "singapore_cpf_calculator/spr_1_gg_common"
require_relative "singapore_cpf_calculator/spr_2_fg_common"
require_relative "singapore_cpf_calculator/spr_2_gg_common"
require_relative "singapore_cpf_calculator/year_2014"
require_relative "singapore_cpf_calculator/year_2015"
