require 'spec_helper'

describe SingaporeCPFCalculator::SPRStatus do

  describe ".get" do

    subject(:status) { described_class.get current_date, status_start_date: status_start_date}

    let(:status_start_date) { Date.new(2013, 6, 20) }

    context "when the permanent residency is on the start of 1st year" do
      let(:current_date) { Date.new(2013, 6, 20) }

      it { expect(status).to eq "SPR1" }
    end

    context "when the permanent residency is on the end of 1st year" do
      let(:current_date) { Date.new(2014, 6, 30) }

      it { expect(status).to eq "SPR1" }
    end

    context "when the permanent residency is on the start of 2nd year" do
      let(:current_date) { Date.new(2014, 7, 1) }

      it { expect(status).to eq "SPR2" }
    end

    context "when the permanent residency is on the end of 2nd year" do
      let(:current_date) { Date.new(2015, 6, 30) }

      it { expect(status).to eq "SPR2" }
    end

    context "when the permanent residency is on the start of 3rd year" do
      let(:current_date) { Date.new(2015, 7, 1) }

      it { expect(status).to eq "SPR3" }
    end

    context "when the permanent residency is on the on or after 3rd year" do
      let(:current_date) { Date.new(2030, 7, 1) }

      it { expect(status).to eq "SPR3" }
    end

  end
end
