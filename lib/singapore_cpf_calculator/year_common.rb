module SingaporeCPFCalculator

  module YearCommon

    # @param [String] status: ["citizen", "permanent_resident", "foreigner"]
    # @param [Date] current_date: current date used to determine permanent residency's duration
    # @param [Date] spr_start_date: date when the permanent residency started
    # @param [String] employee_contribution_type: ["full", "graduated"]
    # @param [String] employer_contribution_type: ["full", "graduated"]
    # @return [#residency_module]
    def module_for_residency(
      status:,
      current_date:,
      spr_start_date:,
      employee_contribution_type:,
      employer_contribution_type:
    )
      residency_modules.find { |mod|
        mod.applies_to? status: status,
                        current_date: current_date,
                        spr_start_date: spr_start_date,
                        employee_contribution_type: employee_contribution_type,
                        employer_contribution_type: employer_contribution_type
      } or raise ArgumentError, "could not find residency module"
    end

  end

end
