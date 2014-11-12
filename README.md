# SingaporeCPFCalculator

`SingaporeCPFCalculator` is the gem PayrollHero.com created and use to calculate for Singapore's
Central Provident Fund (CPF) contributions.

## Support

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

  result # => { "total" => 343.00, "employee" => 190.00, "employer" => 153.00 }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/singapore_cpf_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
