module Bpmn
  class Step < Element
    attr_accessor :incoming, :outgoing

    def initialize(moddle)
      super
      @incoming = []
      @outgoing = []
    end

    def execute(execution)
    end

    def diverging?
      outgoing.length > 1
    end

    def converging?
      incoming.length > 1
    end

    def outgoing_flows(execution)
      flows = []
      outgoing.each { |flow| flows.push flow if flow.evaluate(execution) }
      return flows
    end
  end
end