# SingaporeCPFCalculator

`SingaporeCPFCalculator` is the gem PayrollHero.com created and use to calculate for Singapore's
Central Provident Fund (CPF) contributions.

## Support

  * [Year 2015](http://mycpf.cpf.gov.sg/NR/rdonlyres/9F38419D-1342-4426-820E-32BA8FDE5C6D/0/CPFContributionandAllocationRatesfrom1January2015.pdf)
    * Singapore Citizens or Singapore Permanent Residents (3rd Year Onwards)
    * Singapore Permanent Residents (SPRs) during 1st Year of SPR Status
      * Graduated Employer & Employee (G/G) Contribution Rate
      * Full Employer & Graduated Employee (F/G) Contribution Rate
    * Singapore Permanent Residents (SPRs) during 2nd Year of SPR Status
      * Graduated Employer & Employee (G/G) Contribution Rate
      * Full Employer & Graduated Employee (F/G) Contribution Rate
  * Year 2014
    * [Singapore Citizens or Singapore Permanent Residents (3rd Year Onwards)](http://mycpf.cpf.gov.sg/NR/rdonlyres/B169395E-335C-479C-AB6E-74BA5FBEC6F0/0/CPFconratetable_from1Jan2014_forPTEandNPEN_SC.pdf)
    * Singapore Permanent Residents (SPRs) during 2nd Year of SPR Status
      * [Graduated Employer & Employee (G/G)](http://mycpf.cpf.gov.sg/NR/rdonlyres/E49C4AFE-8048-4A49-8672-B59D1D34A90B/0/CPFconratetable_from1Jan2014_forPTEandNPEN_2GG.pdf)
      * [Full Employer & Graduated Employee (F/G)](http://mycpf.cpf.gov.sg/NR/rdonlyres/598CEDE2-61D0-44CE-9E96-AAD2FFCE4449/0/CPFconratetable_from1Jan2014_forPTEandNPEN_2FG.pdf)
    * Singapore Permanent Residents (SPRs) during 1st Year of SPR Status
      * [Graduated Employer & Employee (G/G)](http://mycpf.cpf.gov.sg/NR/rdonlyres/90D2E0D8-9922-4CAD-87A6-94D6893954E8/0/CPFconratetable_from1Jan2014_forPTEandNPEN_1GG.pdf)
      * [Full Employer & Graduated Employee (F/G)](http://mycpf.cpf.gov.sg/NR/rdonlyres/32EB83C4-9472-4D25-93D6-D760F486DBE3/0/CPFconratetable_from1Jan2014_forPTEandNPEN_1FG.pdf)

## Installation

Add this line to your application's Gemfile:

    gem 'singapore_cpf_calculator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install singapore_cpf_calculator

## Usage

Use {SingaporeCPFCalculator.calculate} to calculate for CPF contribution. The method return a
{SingaporeCPFCalculator::CPFContribution} object responding to {SingaporeCPFCalculator::CPFContribution#employee},
{SingaporeCPFCalculator::CPFContribution#employer} and {SingaporeCPFCalculator::CPFContribution#total}.

```ruby
  require "singapore_cpf_calculator"

  result = SingaporeCPFCalculator.calculate age: 32,
                                            date: Date.new(2014, 11, 15),
                                            residency_status: "permanent_resident",
                                            spr_start_date: Date.new(2014, 11, 15),
                                            ordinary_wages: 700.00,
                                            additional_wages: 252.00,
                                            employee_contribution_type: "full",
                                            employer_contribution_type: "full"

  result # => #<SingaporeCPFCalculator::CPFContribution ...>
  result.employee # => 190.00
  result.employer # => 153.00
  result.total # => 343.00
```

The following parameters needs to be specified:

  * **age** : age of the employee
  * **date** : current date when the CPF is being calculated for
  * **residency\_status** : residency status of the employee
    * accepted values : `"citizen"`, `"permanent_resident"`
  * **spr\_start\_date** : date when Singapore Permanent Residency (SPR) started
    * notes:
      * this affects how the employee is classified into SPR1, SPR2 or SPR3
      * required if the `residency_status` is `permanent_resident`
    * see: [Year of Singapore Permanent Resident (SPR) Status](http://mycpf.cpf.gov.sg/NR/exeres/3D0D66F9-0085-4FD5-9CB5-35B55C0ADA53,frameless.htm)
  * **ordinary_wages** :
    * see : [ordinary wages definition](http://mycpf.cpf.gov.sg/NR/exeres/24537890-6D8E-495E-80D5-E5EFEFCA1905,frameless.htm)
  * **additional_wages** :
    * see : [additional wages definition](http://mycpf.cpf.gov.sg/Employers/Employers_Guide_to_CPF/Glossary/Glossary_Additional_Wages.htm)
  * **employee\_contribution\_type** : type of rates to use for the employee's contribution
    * accepted values : `"full"`, `"graduated"`
    * note: *full* rates is not supported if the employer's contribution type is *graduated*
  * **employer\_contribution\_type** : type of rates to use
    * accepted values : `"full"`, `"graduated"` type of rates to use for the employer's contribution
    * note: *graduated* rates is not supported if the employee's contribution type is *full*

## Contributing

1. Fork it ( https://github.com/[my-github-username]/singapore_cpf_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
