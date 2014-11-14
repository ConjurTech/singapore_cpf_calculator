module SingaporeCPFCalculator

  class SPRStatus

    class << self
      def get(current_date, status_start_date:)
        new(current_date, status_start_date: status_start_date).get
      end
    end

    def initialize(current_date, status_start_date:)
      @current_date = current_date
      @status_start_date = status_start_date
    end

    def get
      case
      when spr1_start <= current_date && current_date <= spr1_end then "SPR1"
      when spr2_start <= current_date && current_date <= spr2_end then "SPR2"
      when spr3_start <= current_date then "SPR3"
      else
        nil # could not be determined
      end
    end

    private

    attr_reader :current_date, :status_start_date

    def spr1_start
      status_start_date
    end

    def spr1_end
      @spr1_end ||= (spr1_start.beginning_of_month.advance years: 1).end_of_month
    end

    def spr2_start
      @spr2_start ||= spr1_end.beginning_of_month.advance months: 1
    end

    def spr2_end
      @spr2_end ||= spr2_start.advance(months: 11).end_of_month
    end

    def spr3_start
      spr2_end.beginning_of_month.advance(months: 1)
    end

  end

end
